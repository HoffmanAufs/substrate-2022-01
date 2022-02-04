# 节点1
# 将aura 和 grandpa key添加到对应节点里面
./target/debug/node-template key insert \
--base-path ./tmp/C01 \
--chain ./tmp/RawAuraSpec.json \
--scheme Sr25519 \
--suri 0x019216df060179fab7ae75981f7c875fb75eb47e6ff89bcf112d8e3b8ccefa75 \
--password 123456 \
--key-type aura;\
./target/debug/node-template key insert \
--base-path ./tmp/C01 \
--chain ./tmp/RawAuraSpec.json \
--scheme Sr25519 \
--suri 0x019216df060179fab7ae75981f7c875fb75eb47e6ff89bcf112d8e3b8ccefa75 \
--password 123456 \
--key-type gran 

# 节点2
# 将aura 和 grandpa key添加到对应节点里面
./target/debug/node-template key insert \
--base-path ./tmp/C02 \
--chain ./tmp/RawAuraSpec.json \
--scheme Sr25519 \
--suri 0xc07b5fa178d06e545049f117d94633e576271202b6e03665d935b9d89c5055c6 \
--password 123456 \
--key-type aura;\
./target/debug/node-template key insert \
--base-path ./tmp/C02 \
--chain ./tmp/RawAuraSpec.json \
--scheme Sr25519 \
--suri 0xc07b5fa178d06e545049f117d94633e576271202b6e03665d935b9d89c5055c6 \
--password 123456 \
--key-type gran 

# 节点3
# 将aura 和 grandpa key添加到对应节点里面
./target/debug/node-template key insert \
--base-path ./tmp/C03 \
--chain ./tmp/RawAuraSpec.json \
--scheme Sr25519 \
--suri 0xaf905333522e44c57ece667d7c129b0431a81bd8bc336be74d4e7b17dc56bf76 \
--password 123456 \
--key-type aura;\
./target/debug/node-template key insert \
--base-path ./tmp/C03 \
--chain ./tmp/RawAuraSpec.json \
--scheme Sr25519 \
--suri 0xaf905333522e44c57ece667d7c129b0431a81bd8bc336be74d4e7b17dc56bf76 \
--password 123456 \
--key-type gran 

# # 节点4
# # 将aura 和 grandpa key添加到对应节点里面
# ./target/debug/node-template key insert \
# --base-path ./tmp/C04 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri \
# --password 123456 \
# --key-type aura;\
# ./target/debug/node-template key insert \
# --base-path ./tmp/C04 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri \
# --password 123456 \
# --key-type gran 

# # 节点5
# # 将aura 和 grandpa key添加到对应节点里面
# ./target/debug/node-template key insert \
# --base-path ./tmp/C05 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri \
# --password 123456 \
# --key-type aura;\
# ./target/debug/node-template key insert \
# --base-path ./tmp/C05 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri \
# --password 123456 \
# --key-type gran 

# # 节点6
# # 将aura 和 grandpa key添加到对应节点里面
# ./target/debug/node-template key insert \
# --base-path ./tmp/C06 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type aura;\
# ./target/debug/node-template key insert \
# --base-path ./tmp/C06 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type gran 

# # 节点7
# # 将aura 和 grandpa key添加到对应节点里面
# ./target/debug/node-template key insert \
# --base-path ./tmp/C07 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type aura;\
# ./target/debug/node-template key insert \
# --base-path ./tmp/C07 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type gran 

# # 节点8
# # 将aura 和 grandpa key添加到对应节点里面
# ./target/debug/node-template key insert \
# --base-path ./tmp/C08 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type aura;\
# ./target/debug/node-template key insert \
# --base-path ./tmp/C08 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type gran 

# # 节点9
# # 将aura 和 grandpa key添加到对应节点里面
# ./target/debug/node-template key insert \
# --base-path ./tmp/C09 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type aura;\
# ./target/debug/node-template key insert \
# --base-path ./tmp/C09 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type gran 

# # 节点10
# # 将aura 和 grandpa key添加到对应节点里面
# ./target/debug/node-template key insert \
# --base-path ./tmp/C10 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type aura;\
# ./target/debug/node-template key insert \
# --base-path ./tmp/C10 \
# --chain ./tmp/RawAuraSpec.json \
# --scheme Sr25519 \
# --suri  \
# --password 123456 \
# --key-type gran 