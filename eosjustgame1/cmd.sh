
## 准备
cleos system newaccount eosio eosjustgame1 EOS6Fhx9xMx5eNoTQjVSvNVMarT5QpPj9kddJmNbzpCbXMvtbgL9q  --stake-net "0.01 EOS" --stake-cpu "0.1 EOS" --buy-ram-kbytes 2
cleos system newaccount eosio testuser1111 EOS6Fhx9xMx5eNoTQjVSvNVMarT5QpPj9kddJmNbzpCbXMvtbgL9q  --stake-net "0.01 EOS" --stake-cpu "0.1 EOS" --buy-ram-kbytes 2
cleos system newaccount eosio testuser2222 EOS6Fhx9xMx5eNoTQjVSvNVMarT5QpPj9kddJmNbzpCbXMvtbgL9q  --stake-net "0.01 EOS" --stake-cpu "0.1 EOS" --buy-ram-kbytes 2


cleos transfer eosio.token eosjustgame1 "5000 EOS" "test"
cleos transfer eosio.token joetothemoon "5000 EOS" "test"
cleos transfer eosio.token testuser1111 "5000 EOS" "test"
cleos transfer eosio.token testuser2222 "5000 EOS" "test"
cleos transfer eosio.token 1kgj1love24n "5000 EOS" "test"


cleos system newaccount eosio 1kgj1love24n EOS6Fhx9xMx5eNoTQjVSvNVMarT5QpPj9kddJmNbzpCbXMvtbgL9q  --stake-net "0.01 EOS" --stake-cpu "0.1 EOS" --buy-ram-kbytes 1024000

cleos set account permission 1kgj1love24n active '{"threshold": 1,"keys": [{"key": "EOS6tkSGWHB5m9cvpKhYJwCcoQnQMnoek3xbNoWEnHYHcsvXsSTdR","weight": 1}],"accounts":[{"permission":{"actor":"1kgj1love24n","permission":"eosio.code"},"weight":1}]}' owner -p 1kgj1love24n@owner
cleos set contract 1kgj1love24n /Users/joe/Workspace/eos-project/ayana/ayana -p 1kgj1love24n


## 部署
cleos system buyram eosjustgame1 eosjustgame1  1024000 --bytes

cleos set account permission eosjustgame1 active '{"threshold": 1,"keys": [{"key": "EOS6Fhx9xMx5eNoTQjVSvNVMarT5QpPj9kddJmNbzpCbXMvtbgL9q","weight":1}],"accounts":[{"permission":{"actor":"eosjustgame1","permission":"eosio.code"},"weight":1}]}' owner -p eosjustgame1

cleos set contract eosjustgame1 /Users/joe/Workspace/eos-project/ite-fe/just.game/eosjustgame1/build/eosjustgame1 -p eosjustgame1

cleos push action 1kgj1love24n send '["testuser2222", "1.0000 EOS"]' -p 1kgj1love24n
cleos push action 1kgj1love24n send '["eosjustgame1", "1.0000 EOS"]' -p 1kgj1love24n


cleos transfer 1kgj1love24n eosjustgame1 "0.01 EOS" "buy"



cleos set contract eosjustgame1  /Users/joe/Workspace/eos-project/ite-fe/just.game/contract/eosjustgame1/build/payout -p eosjustgame1


# 游戏初始化: 开局时间写在代码里
cleos push action eosjustgame1 init '[]' -p eosjustgame1
# 合约清理
cleos push action eosjustgame1 clean '[]' -p eosjustgame1

# 查看游戏状态
cleos get table eosjustgame1 eosjustgame1 pool