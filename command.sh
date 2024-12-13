

 docker exec -ti cardano-node-bp cardano-cli  query tip --testnet-magic 2 --socket-path /opt/cardano/ipc/socket



 ⚙️ Generating Cross-chain (ecdsa) key
running external command: ./partner-chains-node key generate --scheme ecdsa --output-type json
💾 Inserting Cross-chain (ecdsa) key
running external command: ./partner-chains-node key insert --base-path /opt/cardano/data --scheme ecdsa --key-type crch --suri 'giant spend skirt inner build potato alarm bounce balance material vehicle remain'
💾 Cross-chain key stored at /opt/cardano/data/chains/partner_chains_template/keystore/637263680x03194fa692520023aeab3f9c830d40cd0eabf12804571b7ee47d1838b5aeb4cb4c

⚙️ Generating Grandpa (ed25519) key
running external command: ./partner-chains-node key generate --scheme ed25519 --output-type json
💾 Inserting Grandpa (ed25519) key
running external command: ./partner-chains-node key insert --base-path /opt/cardano/data --scheme ed25519 --key-type gran --suri 'loyal lesson record stone balance lunar oil disagree salute flat name record'
💾 Grandpa key stored at /opt/cardano/data/chains/partner_chains_template/keystore/6772616e0x13b348f1c68261ec712ef37a68e6fbb8beca7e583e5f3252a17c8bf34b4592c8

⚙️ Generating Aura (sr25519) key
running external command: ./partner-chains-node key generate --scheme sr25519 --output-type json
💾 Inserting Aura (sr25519) key
running external command: ./partner-chains-node key insert --base-path /opt/cardano/data --scheme sr25519 --key-type aura --suri 'area knife crack remember tourist jungle tomorrow recipe alcohol general solve plunge'
💾 Aura key stored at /opt/cardano/data/chains/partner_chains_template/keystore/617572610x28f52bbd3147834469f6d903a839b14b33d41fadbd228dc0e26a0dfeb1fab202

🔑 The following public keys were generated and saved to the partner-chains-public-keys.json file:
{
  "sidechain_pub_key": "0x03194fa692520023aeab3f9c830d40cd0eabf12804571b7ee47d1838b5aeb4cb4c",
  "aura_pub_key": "0x28f52bbd3147834469f6d903a839b14b33d41fadbd228dc0e26a0dfeb1fab202",
  "grandpa_pub_key": "0x13b348f1c68261ec712ef37a68e6fbb8beca7e583e5f3252a17c8bf34b4592c8"
}
You may share them with your chain governance authority
if you wish to be included as a permissioned candidate.

⚙️ Generating network key
running external command: ./partner-chains-node key generate-node-key --base-path /opt/cardano/data
command output: Generating key in "/opt/cardano/data/chains/partner_chains_template/network/secret_ed25519"
command output: 12D3KooWBf66nFnBRV8y6zAKzgFiZCDypoe1Tmt7Dm8qfhWgmpYt

🚀 All done!




./partner-chains-cli register2 \
 --chain-id 23 \
 --threshold-numerator 2 \
 --threshold-denominator 3 \
 --governance-authority 0x93f21ad1bba9ffc51f5c323e28a716c7f2a42c5b51517080b90028a6 \
 --genesis-committee-utxo f44d20261bd3e079cc76b4d9b32b3330fea793b465c490766df71be90e577d8a#0 \
 --registration-utxo a11ff65312261b07905f596f893660052f01c8184eaa77e9e06371a20b5dfa40#0 \
 --aura-pub-key 0x06bf905481cfe89e946d7707b600d10d6de27d13bf3bf4c46194f2440f568b00 \
 --grandpa-pub-key 0x84ca83fea372efce2e5dc7a96d0f7cd6f08bc55bda6710233b2a4ad572a1a651 \
 --sidechain-pub-key 0x02cadc6eedccdfad418c8e5159d7038b665375b61781fbb8c20aa05c25fdcfae3b \
 --sidechain-signature bc4a1936e9a02046432eaf20fa57faec50259feb3ebf84fd4368a7e07b5783b2127a9998254d9913b63738eaeb0a02532839b9770b03e2f67b89a9979de2ba4d


./partner-chains-cli register3 \
--chain-id 23 \
--threshold-numerator 2 \
--threshold-denominator 3 \
--governance-authority 0x93f21ad1bba9ffc51f5c323e28a716c7f2a42c5b51517080b90028a6 \
--genesis-committee-utxo f44d20261bd3e079cc76b4d9b32b3330fea793b465c490766df71be90e577d8a#0 \
--registration-utxo a11ff65312261b07905f596f893660052f01c8184eaa77e9e06371a20b5dfa40#0 \
--aura-pub-key 0x06bf905481cfe89e946d7707b600d10d6de27d13bf3bf4c46194f2440f568b00 \
--grandpa-pub-key 0x84ca83fea372efce2e5dc7a96d0f7cd6f08bc55bda6710233b2a4ad572a1a651 \
--sidechain-pub-key 0x02cadc6eedccdfad418c8e5159d7038b665375b61781fbb8c20aa05c25fdcfae3b \
--sidechain-signature bc4a1936e9a02046432eaf20fa57faec50259feb3ebf84fd4368a7e07b5783b2127a9998254d9913b63738eaeb0a02532839b9770b03e2f67b89a9979de2ba4d \
--spo-public-key b0d5f02b1470744410965a99a1508a98e167c548cd20878448a0324803392166 \
--spo-signature f86fe5432f5c9b15b190aef49a6cd744fe062994f510f669f89810813e25eae3249a0520d3523ca44825f55c7cd5be5b09a11dd9b267872bc6ac17bd5ab35f0b




cardano-cli conway query leadership-schedule \
--testnet-magic 2 \
--genesis /opt/cardano/config/preview/shelley-genesis.json \
--stake-pool-id $(cat /opt/cardano/config/preview//keys/stakepoolid.txt) \
--vrf-signing-key-file /opt/cardano/config/preview//keys/vrf.skey \
--socket-path /opt/cardano/ipc/node.socket \
--current