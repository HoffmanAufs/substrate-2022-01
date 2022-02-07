fmt_str_2="""# Node{}
./target/debug/node-template purge-chain --base-path ./tmp/{} --chain local -y;\\
./target/debug/node-template \\
--base-path ./tmp/{} \\
--chain ./tmp/RawAuraSpec.json \\
--port {} \\
--ws-port {} \\
--rpc-port {} \\
--rpc-methods Unsafe \\
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWLZk8bs6NRoQK58ZkWtx8ECoyWWrDNaYmRkZxyb7TXmaf \\
--name {} &>>./tmp/{}.log &\\
sleep 1s
"""

# print(fmt_str)
for i in range(0, 20):
    # sprintf(node_name , "C{:02d}", i)

    node_name = "N{:02d}".format(i+1)
    port = 30333 + i
    ws_port = 9945 + i
    rpc_port = 9933 + i

    # print(node_name, port, ws_port, rpc_port)
    print(fmt_str_2.format(i+1, node_name, node_name, port, ws_port, rpc_port, node_name, node_name))
