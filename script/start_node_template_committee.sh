# 启动节点1
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/alice --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/alice \
    --chain local \
    --alice \
    --port 30333 \
    --ws-port 9945 \
    --rpc-port 9933 \
    --node-key 0000000000000000000000000000000000000000000000000000000000000001 \
    --validator \
    &>./tmp/alice.log &\
sleep 1s

./target/debug/node-template purge-chain --base-path ./tmp/bob --chain local -y;\
./target/debug/node-template \
    --base-path ./tmp/bob \
    --chain local \
    --bob \
    --port 30334 \
    --ws-port 9946 \
    --rpc-port 9934 \
    --validator \
    --bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWEyoppNCUx8Yx66oV9fJnriXwCcXwDDUA2kj6vnc6iDEp \
    &>./tmp/bob.log &\
sleep 1s