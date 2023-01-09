mkdir node1 node2 node3 node4
geth --datadir node1 account new # 0x216a8327D2036EC8e8CF0852C729BA719d364317
geth --datadir node2 account new # 0xAA1746e81647D269F6264727f4b208c305E85546
geth --datadir node3 account new # 0xFEe24Bcb51D86578973656bFa1c081a1df959C32
geth --datadir node4 account new # 0x4A6B3A8BC140c280a44cB57938CdAC2600e5f4eA
# geth init --datadir node1 halulu.json
# geth init --datadir node2 halulu.json
# geth init --datadir node3 halulu.json
# geth init --datadir node4 halulu.json
geth init --datadir node1 clique.json
geth init --datadir node2 clique.json
geth init --datadir node3 clique.json
geth init --datadir node4 clique.json
bootnode -genkey boot.key

# run
bootnode -nodekey boot.key -addr :30305
# enode://830249fbca43c2e84dce4e1bacf24d05046ed25af12543bf9c62d2cd7d938da975b6424835f20cb3f46861bb9685a2b101a68ef42b27ad41d8993241514db855@127.0.0.1:0?discport=30305

geth --datadir node1 --port 30306 --bootnodes enode://830249fbca43c2e84dce4e1bacf24d05046ed25af12543bf9c62d2cd7d938da975b6424835f20cb3f46861bb9685a2b101a68ef42b27ad41d8993241514db855@127.0.0.1:0?discport=30305  --networkid 45429 --unlock 0x216a8327D2036EC8e8CF0852C729BA719d364317 --http --http.port 8080 --allow-insecure-unlock --mine
geth --datadir node2 --port 30307 --bootnodes enode://830249fbca43c2e84dce4e1bacf24d05046ed25af12543bf9c62d2cd7d938da975b6424835f20cb3f46861bb9685a2b101a68ef42b27ad41d8993241514db855@127.0.0.1:0?discport=30305  --networkid 45429 --unlock 0xAA1746e81647D269F6264727f4b208c305E85546 --authrpc.port 8552
geth --datadir node3 --port 30308 --bootnodes enode://830249fbca43c2e84dce4e1bacf24d05046ed25af12543bf9c62d2cd7d938da975b6424835f20cb3f46861bb9685a2b101a68ef42b27ad41d8993241514db855@127.0.0.1:0?discport=30305  --networkid 45429 --unlock 0xFEe24Bcb51D86578973656bFa1c081a1df959C32 --authrpc.port 8553
geth --datadir node4 --port 30309 --bootnodes enode://830249fbca43c2e84dce4e1bacf24d05046ed25af12543bf9c62d2cd7d938da975b6424835f20cb3f46861bb9685a2b101a68ef42b27ad41d8993241514db855@127.0.0.1:0?discport=30305  --networkid 45429 --unlock 0x4A6B3A8BC140c280a44cB57938CdAC2600e5f4eA --authrpc.port 8554

curl -X POST -H "Content-Type: application/json" localhost:8080 --data '{"jsonrpc": "2.0", "id": 1, "method": "eth_sendTransaction", "params": [{
  "from": "0x216a8327D2036EC8e8CF0852C729BA719d364317",
  "to": "0xAA1746e81647D269F6264727f4b208c305E85546",
  "gas": "0x76c0",
  "gasPrice": "0x9184e72a000",
  "value": "0x9184e72a",
  "data": "0xd46e8dd67c5d32be8d46e8dd67c5d32be8058bb8eb970870f072445675058bb8eb970870f072445675"
}]}'
