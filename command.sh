docker run --detach \
  --name cardano-node-bp \
  --restart unless-stopped \
  -e CARDANO_NETWORK=preview \
  -e RESTORE_SNAPSHOT=false \
  -e CARDANO_BLOCK_PRODUCER=true \
  -e CARDANO_SHELLEY_KES_KEY=/opt/cardano/config/preview/keys/kes.skey \
  -e CARDANO_SHELLEY_OPERATIONAL_CERTIFICATE=/opt/cardano/config/preview/keys/node.cert \
  -e CARDANO_SHELLEY_VRF_KEY=/opt/cardano/config/preview/keys/vrf.skey \
  -v /srv/cardano/node-db:/opt/cardano/data \
  -v /home/ubuntu/docker-cardano-node/ipc:/opt/cardano/ipc \
  -v /home/ubuntu/docker-cardano-node/config:/opt/cardano/config \
  -v /home/ubuntu/partner-chain-deps-docker:/opt/cardano/partner-chain-deps-docker \
  -p 3001:3001 \
  -p 12798:12798 \
  ghcr.io/blinklabs-io/cardano-node run


  docker exec -it cardano-node-bp bash
cardano-cli query tip --testnet-magic 2 --socket-path /opt/cardano/ipc/socket
cardano-cli query tip --testnet-magic 2 --socket-path /home/ubuntu/docker-cardano-node/ipc/socket


cd $NODE_HOME
cardano-cli conway node key-gen-KES \
    --verification-key-file kes.vkey \
    --signing-key-file kes.skey

cardano-cli conway node key-gen \
    --cold-verification-key-file node.vkey \
    --cold-signing-key-file node.skey \
    --operational-certificate-issue-counter node.counter


pushd +1
slotsPerKESPeriod=$(cat shelley-genesis.json | jq -r '.slotsPerKESPeriod')
echo slotsPerKESPeriod: ${slotsPerKESPeriod}

slotNo=$(cardano-cli conway query tip --testnet-magic 2 --socket-path /opt/cardano/ipc/socket| jq -r '.slot')
echo slotNo: ${slotNo}



cardano-cli conway node issue-op-cert \
    --kes-verification-key-file kes.vkey \
    --cold-signing-key-file node.skey \
    --operational-certificate-issue-counter node.counter \
    --kes-period 516 \
    --out-file node.cert


 docker exec -ti cardano-node-bp cardano-cli  query tip --testnet-magic 2 --socket-path /opt/cardano/ipc/socket