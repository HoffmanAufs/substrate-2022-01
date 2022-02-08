bootnode_peer_id="12D3KooWSjHPoEtyQoJBW2MtARYwkikZv66gGhqnV5GESqANu4Le"

# Node1
./target/debug/node-template purge-chain --base-path ./tmp/N01 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N01 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30333 \
    --ws-port 9945 \
    --rpc-port 9933 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N01 &>>./tmp/N01.log &\
sleep 1s

# Node2
./target/debug/node-template purge-chain --base-path ./tmp/N02 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N02 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30334 \
    --ws-port 9946 \
    --rpc-port 9934 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N02 &>>./tmp/N02.log &\
sleep 1s

# Node3
./target/debug/node-template purge-chain --base-path ./tmp/N03 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N03 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30335 \
    --ws-port 9947 \
    --rpc-port 9935 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N03 &>>./tmp/N03.log &\
sleep 1s

# Node4
./target/debug/node-template purge-chain --base-path ./tmp/N04 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N04 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30336 \
    --ws-port 9948 \
    --rpc-port 9936 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N04 &>>./tmp/N04.log &\
sleep 1s

# Node5
./target/debug/node-template purge-chain --base-path ./tmp/N05 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N05 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30337 \
    --ws-port 9949 \
    --rpc-port 9937 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N05 &>>./tmp/N05.log &\
sleep 1s

# Node6
./target/debug/node-template purge-chain --base-path ./tmp/N06 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N06 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30338 \
    --ws-port 9950 \
    --rpc-port 9938 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N06 &>>./tmp/N06.log &\
sleep 1s

# Node7
./target/debug/node-template purge-chain --base-path ./tmp/N07 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N07 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30339 \
    --ws-port 9951 \
    --rpc-port 9939 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N07 &>>./tmp/N07.log &\
sleep 1s

# Node8
./target/debug/node-template purge-chain --base-path ./tmp/N08 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N08 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30340 \
    --ws-port 9952 \
    --rpc-port 9940 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N08 &>>./tmp/N08.log &\
sleep 1s

# Node9
./target/debug/node-template purge-chain --base-path ./tmp/N09 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N09 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30341 \
    --ws-port 9953 \
    --rpc-port 9941 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N09 &>>./tmp/N09.log &\
sleep 1s

# Node10
./target/debug/node-template purge-chain --base-path ./tmp/N10 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N10 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30342 \
    --ws-port 9954 \
    --rpc-port 9942 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N10 &>>./tmp/N10.log &\
sleep 1s

# Node11
./target/debug/node-template purge-chain --base-path ./tmp/N11 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N11 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30343 \
    --ws-port 9955 \
    --rpc-port 9943 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N11 &>>./tmp/N11.log &\
sleep 1s

# Node12
./target/debug/node-template purge-chain --base-path ./tmp/N12 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N12 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30344 \
    --ws-port 9956 \
    --rpc-port 9944 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N12 &>>./tmp/N12.log &\
sleep 1s

# Node13
./target/debug/node-template purge-chain --base-path ./tmp/N13 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N13 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30345 \
    --ws-port 9957 \
    --rpc-port 9945 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N13 &>>./tmp/N13.log &\
sleep 1s

# Node14
./target/debug/node-template purge-chain --base-path ./tmp/N14 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N14 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30346 \
    --ws-port 9958 \
    --rpc-port 9946 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N14 &>>./tmp/N14.log &\
sleep 1s

# Node15
./target/debug/node-template purge-chain --base-path ./tmp/N15 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N15 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30347 \
    --ws-port 9959 \
    --rpc-port 9947 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N15 &>>./tmp/N15.log &\
sleep 1s

# Node16
./target/debug/node-template purge-chain --base-path ./tmp/N16 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N16 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30348 \
    --ws-port 9960 \
    --rpc-port 9948 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N16 &>>./tmp/N16.log &\
sleep 1s

# Node17
./target/debug/node-template purge-chain --base-path ./tmp/N17 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N17 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30349 \
    --ws-port 9961 \
    --rpc-port 9949 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N17 &>>./tmp/N17.log &\
sleep 1s

# Node18
./target/debug/node-template purge-chain --base-path ./tmp/N18 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N18 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30350 \
    --ws-port 9962 \
    --rpc-port 9950 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N18 &>>./tmp/N18.log &\
sleep 1s

# Node19
./target/debug/node-template purge-chain --base-path ./tmp/N19 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N19 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30351 \
    --ws-port 9963 \
    --rpc-port 9951 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N19 &>>./tmp/N19.log &\
sleep 1s

# Node20
./target/debug/node-template purge-chain --base-path ./tmp/N20 --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/N20 \
    --chain ./tmp/RawAuraSpec.json \
    --port 30352 \
    --ws-port 9964 \
    --rpc-port 9952 \
    --rpc-methods Unsafe \
    --telemetry-url 'wss://telemetry.polkadot.io/submit/ 0' \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
    --name N20 &>>./tmp/N20.log &\
sleep 1s