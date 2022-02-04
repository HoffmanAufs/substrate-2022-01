fmt_str = """# 启动节点{}
# 按照生成的Raw配置文件启动node-template
./target/debug/node-template purge-chain --base-path ./tmp/{} --chain local -y;\\
deepin-terminal -e "./target/debug/node-template \\
--base-path ./tmp/{} \\
--chain ./tmp/RawAuraSpec.json \\
--port {} \\
--ws-port {} \\
--rpc-port {} \\
--rpc-methods Unsafe \\
--bootnodes /ip4/127.0.0.1/tcp/30333/p2p/12D3KooWC17EjNnDoXFVNDynbzwc4K5HmQC7j1u7qLsTbwAvCYwj \\
--name {} ";\\
sleep 1s
"""

# print(fmt_str)
for i in range(0, 10):
    # sprintf(node_name , "C{:02d}", i)

    node_name = "N{:02d}".format(i+1)
    port = 30333 + 10 + i
    ws_port = 9945 + 10 + i
    rpc_port = 9933 + 10 + i

    # print(node_name, port, ws_port, rpc_port)
    print(fmt_str.format(i+1, node_name, node_name, port, ws_port, rpc_port, node_name))