# 生成默认的配置模板
./target/release/node-template build-spec --disable-default-bootnode --chain local > customSpec.json

# 根据模板，修改customSpec.json的aura, grandp内容，

# 产生启动时可用的Raw配置文件
./target/release/node-template build-spec --chain=customSpec.json --raw --disable-default-bootnode > customSpecRaw.json

# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path /tmp/node01 --chain local -y

./target/debug/node-template \
--base-path /tmp/node01 \
--chain ./AuraRawSpec.json \
--port 30333 \
--ws-port 9945 \
--rpc-port 9933 \
--validator \
--rpc-methods Unsafe \
--name MyNode01

./target/debug/node-template purge-chain --base-path /tmp/node02 --chain local -y

./target/debug/node-template \
--base-path /tmp/node02 \
--chain ./AuraRawSpec.json \
--port 30334 \
--ws-port 9946 \
--rpc-port 9934 \
--validator \
--rpc-methods Unsafe \
--name MyNode02 \
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWEpqNRcESnVRpZem1M9G24ypWnCsRPACt5DsQke1PTpca

# 将aura key添加到对应节点里面
./target/release/node-template key insert \
--base-path /tmp/node01 \
--chain AuraRawSpec.json \
--scheme Sr25519 \
--suri 0xe6c08bae89e39c5e4ed300b5824d7222f099a66121b24ec377e4b23b379ebada \
--password 123456 \
--key-type aura

# 将grandpa key添加到对应节点里面
./target/release/node-template key insert \
--base-path /tmp/node01 \
--chain AuraRawSpec.json \
--scheme Sr25519 \
--suri 0xe6c08bae89e39c5e4ed300b5824d7222f099a66121b24ec377e4b23b379ebada \
--password 123456 \
--key-type gran 

# 通过subkey 产生账户的key
./target/release/subkey generate --scheme Sr25519 --password 123456
# Secret phrase:       provide symptom praise empty hold celery lunar pet swamp egg fruit toss
#   Secret seed:       0xe6c08bae89e39c5e4ed300b5824d7222f099a66121b24ec377e4b23b379ebada
#   Public key (hex):  0x3eb829e3faff967d9adf283fe33b1184e887b38725798fbc9058f7e6e3d2f470
#   Account ID:        0x3eb829e3faff967d9adf283fe33b1184e887b38725798fbc9058f7e6e3d2f470
#   Public key (SS58): 5DUwXvm4ZML6hmVaMXHzJUBbmNVTQXsYRHcWhaMPKqYepfde
#   SS58 Address:      5DUwXvm4ZML6hmVaMXHzJUBbmNVTQXsYRHcWhaMPKqYepfde

./target/release/subkey generate --scheme Sr25519 --password 123456
# Secret phrase:       cliff staff subject modify myself frost snack seminar thought rent dumb topic
#   Secret seed:       0xf9debed82fdcfdff5c66ff1c6a3c3c0e44628b19f79d73ae377c45071344248e
#   Public key (hex):  0x72e9385a5f6ea6a386a1aa45e4daa6266c188dc9415ea0240e87018883a0f335
#   Account ID:        0x72e9385a5f6ea6a386a1aa45e4daa6266c188dc9415ea0240e87018883a0f335
#   Public key (SS58): 5EfNba7RTK7R9v9QhLkU4XHiurzkKHyNqfXUdAn2qebb4BCn
#   SS58 Address:      5EfNba7RTK7R9v9QhLkU4XHiurzkKHyNqfXUdAn2qebb4BCn
