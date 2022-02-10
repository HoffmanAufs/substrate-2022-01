#![allow(missing_docs)]
use crate::{
	config::{self, ProtocolId},
	error,
	service::NetworkService,
	utils::LruHashSet,
	Event, ExHashT, ObservedRole,
};

use codec::{Encode, Decode};
use bytes::Bytes;
use futures::{channel::mpsc, prelude::*};
use libp2p::{multiaddr, PeerId};
use prometheus_endpoint::{register, Counter, PrometheusError, Registry, U64};
use sp_runtime::traits::{Block as BlockT};
use std::{
	borrow::Cow,
	collections::{HashMap},
	iter,
	num::NonZeroUsize,
	pin::Pin,
	sync::{
		Arc,
	},
};

use sp_consensus::{VoteData, VoteElectionRequest, ElectionData};

const MAX_NOTIFICATION_SIZE: u64 = 16 * 1024 * 1024;
const MAX_KNOWN_NOTIFICATIONS: usize = 10240; // ~300kb per peer + overhead.

struct Metrics {
	propagated_numbers: Counter<U64>,
}

impl Metrics {
	fn register(r: &Registry) -> Result<Self, PrometheusError> {
		Ok(Metrics {
			propagated_numbers: register(
				Counter::new(
					"sync_propaget_numbers",
					"Number of producer vote number propagated to at least one peer",
				)?,
				r,
			)?,
		})
	}
}

pub struct VoteElectionHandlerPrototype {
	protocol_name: Cow<'static, str>,
}

impl VoteElectionHandlerPrototype {
	/// Create a new instance.
	pub fn new(protocol_id: ProtocolId) -> Self {
		VoteElectionHandlerPrototype {
			protocol_name: Cow::from({
				let mut proto = String::new();
				proto.push_str("/");
				proto.push_str(protocol_id.as_ref());
				proto.push_str("/vote-electoin/1");
				proto
			}),
		}
	}

	/// Returns the configuration of the set to put in the network configuration.
	pub fn set_config(&self) -> config::NonDefaultSetConfig {
		config::NonDefaultSetConfig {
			notifications_protocol: self.protocol_name.clone(),
			fallback_names: Vec::new(),
			max_notification_size: MAX_NOTIFICATION_SIZE,
			set_config: config::SetConfig {
				in_peers: 0,
				out_peers: 0,
				reserved_nodes: Vec::new(),
				non_reserved_mode: config::NonReservedPeerMode::Deny,
			},
		}
	}

	/// Turns the prototype into the actual handler. Returns a controller that allows controlling
	/// the behaviour of the handler while it's running.
	///
	/// Important: the transactions handler is initially disabled and doesn't gossip transactions.
	/// You must call [`TransactionsHandlerController::set_gossip_enabled`] to enable it.
	pub fn build<B: BlockT + 'static, H: ExHashT>(
		self,
		service: Arc<NetworkService<B, H>>,
		metrics_registry: Option<&Registry>,
	) -> error::Result<(VoteElectionHandler<B, H>, VoteElectionHandlerController<B>)> {
		let event_stream = service.event_stream("vote-election-handler").boxed();
		let (to_handler, from_controller) = mpsc::unbounded();
		// let gossip_enabled = Arc::new(AtomicBool::new(false));
		// let (vote_notification_tx, vote_notification_rx) = mpsc::unbounded();
		let (local_event_tx, local_event_rx) = mpsc::unbounded();

		let handler = VoteElectionHandler {
			protocol_name: self.protocol_name,
			service,
			event_stream,
			peers: HashMap::new(),
			from_controller,
			metrics: if let Some(r) = metrics_registry {
				Some(Metrics::register(r)?)
			} else {
				None
			},
			vote_notification_tx: None,
			election_notification_tx: None,
			local_event_tx: local_event_tx,
			local_event_rx: local_event_rx,
		};

		let controller = VoteElectionHandlerController { 
			to_handler,
		};

		Ok((handler, controller))
	}
}

pub struct VoteElectionHandlerController<B: BlockT>{
    to_handler: mpsc::UnboundedSender<ToHandler<B>>,
}

impl<B: BlockT> VoteElectionHandlerController<B>{
	pub fn handle_request(&self, request: VoteElectionRequest<B>){
		match request{
			VoteElectionRequest::BuildVoteStream(tx) =>{
				let _ = self.to_handler.unbounded_send(ToHandler::BuildVoteStream(tx));
			},
			VoteElectionRequest::BuildElectionStream(tx)=>{
				let _ = self.to_handler.unbounded_send(ToHandler::BuildElectionStream(tx));
			},
			VoteElectionRequest::PropagateVote(vote_data) => {
				let _ = self.to_handler.unbounded_send(ToHandler::PropagateVote(vote_data));
			},
			VoteElectionRequest::PropagateElection(election_data)=>{
				let _ = self.to_handler.unbounded_send(ToHandler::PropagateElection(election_data));
			},
		}
	}
}

#[derive(Debug)]
enum ToHandler<B: BlockT> {
	BuildVoteStream(mpsc::UnboundedSender<VoteData<B>>),
	BuildElectionStream(mpsc::UnboundedSender<ElectionData<B>>),
	PropagateVote(VoteData<B>),
	PropagateElection(ElectionData<B>),
}

/// Handler for transactions. Call [`TransactionsHandler::run`] to start the processing.
pub struct VoteElectionHandler<B: BlockT + 'static, H: ExHashT> {
	protocol_name: Cow<'static, str>,

	/// Network service to use to send messages and manage peers.
	service: Arc<NetworkService<B, H>>,
	/// Stream of networking events.
	event_stream: Pin<Box<dyn Stream<Item = Event> + Send>>,
	// All connected peers
	peers: HashMap<PeerId, Peer<H>>,
	// transaction_pool: Arc<dyn TransactionPool<H, B>>,
	// local_role: config::Role,
	from_controller: mpsc::UnboundedReceiver<ToHandler<B>>,
	/// Prometheus metrics.
	metrics: Option<Metrics>,

	vote_notification_tx: Option<mpsc::UnboundedSender<VoteData<B>>>,
	election_notification_tx: Option<mpsc::UnboundedSender<ElectionData<B>>>,

	local_event_tx: mpsc::UnboundedSender<Event>,
	local_event_rx: mpsc::UnboundedReceiver<Event>,
}

#[derive(Encode, Decode, Debug)]
enum VoteElectionNotification<B: BlockT>{
	Vote(VoteData<B>),
	Election(ElectionData<B>),
}

/// Peer information
#[derive(Debug)]
struct Peer<H: ExHashT> {
	/// Holds a set of transactions known to this peer.
	known_transactions: LruHashSet<H>,
	role: ObservedRole,
}

impl<B: BlockT + 'static, H: ExHashT> VoteElectionHandler<B, H> {
	/// Turns the [`TransactionsHandler`] into a future that should run forever and not be
	/// interrupted.
	pub async fn run(mut self) {
		loop {
			futures::select! {
				network_event = self.event_stream.next().fuse() => {
					if let Some(network_event) = network_event {
						self.handle_network_event(network_event).await;
					} else {
						// Networking has seemingly closed. Closing as well.
						return;
					}
				},
				// message from self
				self_event = self.local_event_rx.select_next_some() =>{
					self.handle_network_event(self_event).await;
				},
				message = self.from_controller.select_next_some() => {
					match message {
						ToHandler::BuildVoteStream(tx)=>{
							self.vote_notification_tx = Some(tx);
						},
						ToHandler::BuildElectionStream(tx)=>{
							self.election_notification_tx = Some(tx);
						}
						ToHandler::PropagateVote(vote_data) => {
							self.propagate_vote(vote_data);
						},
						ToHandler::PropagateElection(election_data)=>{
							self.propagate_election(election_data);
						},
					}
				},
			}
		}
	}

	async fn handle_network_event(&mut self, event: Event) {
		match event {
			Event::Dht(_) => {},
			Event::SyncConnected { remote } => {
				let addr = iter::once(multiaddr::Protocol::P2p(remote.into()))
					.collect::<multiaddr::Multiaddr>();
				let result = self.service.add_peers_to_reserved_set(
					self.protocol_name.clone(),
					iter::once(addr).collect(),
				);
				if let Err(err) = result {
					log::error!(target: "sync", "Add reserved peer failed: {}", err);
				}
			},
			Event::SyncDisconnected { remote } => {
				// let addr = iter::once(multiaddr::Protocol::P2p(remote.into()))
				// 	.collect::<multiaddr::Multiaddr>();
				// let result = self.service.remove_peers_from_reserved_set(
				// 	self.protocol_name.clone(),
				// 	iter::once(addr).collect(),
				// );
				// if let Err(err) = result {
				// 	log::error!(target: "sync", "Removing reserved peer failed: {}", err);
				// }
				self.service.remove_peers_from_reserved_set(
					self.protocol_name.clone(), 
					iter::once(remote).collect(),
				);
			},

			Event::NotificationStreamOpened { remote, protocol, role, .. }
				if protocol == self.protocol_name =>
			{
				let _was_in = self.peers.insert(
					remote,
					Peer {
						known_transactions: LruHashSet::new(
							NonZeroUsize::new(MAX_KNOWN_NOTIFICATIONS).expect("Constant is nonzero"),
						),
						role,
					},
				);
				debug_assert!(_was_in.is_none());
			}
			Event::NotificationStreamClosed { remote, protocol }
				if protocol == self.protocol_name =>
			{
				let _peer = self.peers.remove(&remote);
				debug_assert!(_peer.is_some());
			}

			Event::NotificationsReceived { remote:_, messages } => {
				for (protocol, message) in messages {
					if protocol != self.protocol_name {
						continue
					}

					if let Ok(msg) = <VoteElectionNotification<B> as Decode>::decode(&mut message.as_ref()){
						match msg {
							VoteElectionNotification::Vote(vote_data)=>{
								// log::info!("<<<< VoteElectionNotification:VoteV2");
								// log::info!("<<<< vote_v2: {:?} from: {:?}", vote_data, remote);
								self.vote_notification_tx.as_ref().map(|v|{
									let _ = v.unbounded_send(vote_data);
								});
							},
							VoteElectionNotification::Election(election_data)=>{
								self.election_notification_tx.as_ref().map(|v|{
									// log::info!("Election");
									let _ = v.unbounded_send(election_data);
								});
							},
						}
					}
				}
			},

			// Not our concern.
			Event::NotificationStreamOpened { .. } | Event::NotificationStreamClosed { .. } => {},
		}
	}

	fn propagate_election(&mut self, election_data: ElectionData<B>){
		let mut propagated_numbers = 0;
		// let hash = election_data.hash.clone();
		let to_send = VoteElectionNotification::Election(election_data).encode();

		for (who, peer) in self.peers.iter_mut() {
			if matches!(peer.role, ObservedRole::Light) {
				continue;
			}

			propagated_numbers += 1;

			// log::info!(">>>> Election {:?}, client/network/src/producer_select.rs: 540", who);
			self.service.write_notification(
				who.clone(),
				self.protocol_name.clone(),
				to_send.clone(),
			);
		}

		// log::info!(">>>> Election to local_peer_id: client/network/src/producer_select.rs: 548");
		let local_peer_id = self.service.local_peer_id();
		let _ = self.local_event_tx.unbounded_send(
			Event::NotificationsReceived{
				remote: local_peer_id.clone(), 
				messages: vec![(self.protocol_name.clone(), Bytes::from(to_send.clone()))],
			}
		);

		// log::info!("♓ Propagate election({}) to {} peers", hash, propagated_numbers);

		if let Some(ref metriecs) = self.metrics {
			metriecs.propagated_numbers.inc_by(propagated_numbers as _)
		}
	}

	fn propagate_vote(&mut self, vote_data: VoteData<B>){
		// log::info!("{:?}", vote_data);
		let mut propagated_numbers = 0;
		// let hash = vote_data.hash.clone();

		let to_send = VoteElectionNotification::Vote(vote_data).encode();

		for (who, peer) in self.peers.iter_mut() {
			if matches!(peer.role, ObservedRole::Light) {
				continue;
			}

			propagated_numbers += 1;

			// log::info!(">>>> {:?}, client/network/src/producer_select.rs:514", who);
			self.service.write_notification(
				who.clone(),
				self.protocol_name.clone(),
				to_send.clone(),
			);
		}

		// log::info!(">>>> to local_peer_id: client/network/src/producer_select.rs:522");
		let local_peer_id = self.service.local_peer_id();
		let _ = self.local_event_tx.unbounded_send(
			Event::NotificationsReceived{
				remote: local_peer_id.clone(), 
				messages: vec![(self.protocol_name.clone(), Bytes::from(to_send.clone()))],
			}
		);

		// ::info!("♓ Propagate vote ({}) to {} peers", hash, propagated_numbers);

		if let Some(ref metriecs) = self.metrics {
			metriecs.propagated_numbers.inc_by(propagated_numbers as _)
		}
	}
}