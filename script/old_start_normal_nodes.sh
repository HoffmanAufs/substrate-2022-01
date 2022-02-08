# 启动节点1
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N01 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N01 \
--chain ./tmp/RawAuraSpec.json \
--port 30343 \
--ws-port 9955 \
--rpc-port 9943 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N01 ";\
sleep 1s

# 启动节点2
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N02 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N02 \
--chain ./tmp/RawAuraSpec.json \
--port 30344 \
--ws-port 9956 \
--rpc-port 9944 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N02 ";\
sleep 1s

# 启动节点3
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N03 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N03 \
--chain ./tmp/RawAuraSpec.json \
--port 30345 \
--ws-port 9957 \
--rpc-port 9945 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N03 ";\
sleep 1s

# 启动节点4
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N04 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N04 \
--chain ./tmp/RawAuraSpec.json \
--port 30346 \
--ws-port 9958 \
--rpc-port 9946 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N04 ";\
sleep 1s

# 启动节点5
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N05 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N05 \
--chain ./tmp/RawAuraSpec.json \
--port 30347 \
--ws-port 9959 \
--rpc-port 9947 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N05 ";\
sleep 1s

# 启动节点6
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N06 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N06 \
--chain ./tmp/RawAuraSpec.json \
--port 30348 \
--ws-port 9960 \
--rpc-port 9948 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N06 ";\
sleep 1s

# 启动节点7
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N07 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N07 \
--chain ./tmp/RawAuraSpec.json \
--port 30349 \
--ws-port 9961 \
--rpc-port 9949 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N07 ";\
sleep 1s

# 启动节点8
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N08 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N08 \
--chain ./tmp/RawAuraSpec.json \
--port 30350 \
--ws-port 9962 \
--rpc-port 9950 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N08 ";\
sleep 1s

# 启动节点9
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N09 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N09 \
--chain ./tmp/RawAuraSpec.json \
--port 30351 \
--ws-port 9963 \
--rpc-port 9951 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N09 ";\
sleep 1s

# 启动节点10
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N10 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N10 \
--chain ./tmp/RawAuraSpec.json \
--port 30352 \
--ws-port 9964 \
--rpc-port 9952 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N10 ";\
sleep 1s

# 启动节点11
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N11 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N11 \
--chain ./tmp/RawAuraSpec.json \
--port 30353 \
--ws-port 9965 \
--rpc-port 9953 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N11 ";\
sleep 1s

# 启动节点12
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/N12 --chain local -y;\
deepin-terminal -e "./target/debug/node-template \
--base-path ./tmp/N12 \
--chain ./tmp/RawAuraSpec.json \
--port 30354 \
--ws-port 9966 \
--rpc-port 9954 \
--rpc-methods Unsafe \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
--name N12 ";\
sleep 1s

# # 启动节点13
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N13 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N13 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30355 \
# --ws-port 9967 \
# --rpc-port 9955 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
# --name N13 ";\
# sleep 1s

# # 启动节点14
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N14 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N14 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30356 \
# --ws-port 9968 \
# --rpc-port 9956 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
# --name N14 ";\
# sleep 1s

# # 启动节点15
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N15 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N15 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30357 \
# --ws-port 9969 \
# --rpc-port 9957 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
# --name N15 ";\
# sleep 1s

# # 启动节点16
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N16 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N16 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30358 \
# --ws-port 9970 \
# --rpc-port 9958 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
# --name N16 ";\
# sleep 1s

# # 启动节点17
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N17 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N17 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30359 \
# --ws-port 9971 \
# --rpc-port 9959 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
# --name N17 ";\
# sleep 1s

# # 启动节点18
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N18 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N18 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30360 \
# --ws-port 9972 \
# --rpc-port 9960 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
# --name N18 ";\
# sleep 1s

# # 启动节点19
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N19 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N19 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30361 \
# --ws-port 9973 \
# --rpc-port 9961 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
# --name N19 ";\
# sleep 1s

# # 启动节点20
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N20 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N20 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30362 \
# --ws-port 9974 \
# --rpc-port 9962 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/$bootnode_peer_id \
# --name N20 ";\
# sleep 1s