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
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
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
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
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
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
--name N03 ";\
sleep 1s

# # 启动节点4
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N04 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N04 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30346 \
# --ws-port 9958 \
# --rpc-port 9946 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
# --name N04 ";\
# sleep 1s

# # 启动节点5
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N05 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N05 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30347 \
# --ws-port 9959 \
# --rpc-port 9947 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
# --name N05 ";\
# sleep 1s

# # 启动节点6
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N06 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N06 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30348 \
# --ws-port 9960 \
# --rpc-port 9948 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
# --name N06 ";\
# sleep 1s

# # 启动节点7
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N07 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N07 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30349 \
# --ws-port 9961 \
# --rpc-port 9949 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
# --name N07 ";\
# sleep 1s

# # 启动节点8
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N08 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N08 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30350 \
# --ws-port 9962 \
# --rpc-port 9950 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
# --name N08 ";\
# sleep 1s

# # 启动节点9
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N09 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N09 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30351 \
# --ws-port 9963 \
# --rpc-port 9951 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
# --name N09 ";\
# sleep 1s

# # 启动节点10
# # 按照生成的Raw配置文件启动node-template
# ./target/debug/node-template purge-chain --base-path ./tmp/N10 --chain local -y;\
# deepin-terminal -e "./target/debug/node-template \
# --base-path ./tmp/N10 \
# --chain ./tmp/RawAuraSpec.json \
# --port 30352 \
# --ws-port 9964 \
# --rpc-port 9952 \
# --rpc-methods Unsafe \
# --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \
# --name N10 ";\
# sleep 1s