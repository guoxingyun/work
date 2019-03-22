./clivsc --url http://27.155.88.190:8888 create account eosio eosio.bpay VSC6Ef6bban2MbcgJAReN1Ai6ZdHkceUgeKgVBKSnpY8WCG2rWrwa
./clivsc --url http://27.155.88.190:8888 create account eosio eosio.msig VSC6Ef6bban2MbcgJAReN1Ai6ZdHkceUgeKgVBKSnpY8WCG2rWrwa
./clivsc --url http://27.155.88.190:8888 create account eosio eosio.names VSC6Ef6bban2MbcgJAReN1Ai6ZdHkceUgeKgVBKSnpY8WCG2rWrwa
./clivsc --url http://27.155.88.190:8888 create account eosio eosio.ram VSC6Ef6bban2MbcgJAReN1Ai6ZdHkceUgeKgVBKSnpY8WCG2rWrwa
./clivsc --url http://27.155.88.190:8888 create account eosio eosio.ramfee VSC6Ef6bban2MbcgJAReN1Ai6ZdHkceUgeKgVBKSnpY8WCG2rWrwa
./clivsc --url http://27.155.88.190:8888 create account eosio eosio.saving VSC6Ef6bban2MbcgJAReN1Ai6ZdHkceUgeKgVBKSnpY8WCG2rWrwa
./clivsc --url http://27.155.88.190:8888 create account eosio eosio.stake VSC6Ef6bban2MbcgJAReN1Ai6ZdHkceUgeKgVBKSnpY8WCG2rWrwa
./clivsc --url http://27.155.88.190:8888 create account eosio eosio.token VSC6Ef6bban2MbcgJAReN1Ai6ZdHkceUgeKgVBKSnpY8WCG2rWrwa
./clivsc --url http://27.155.88.190:8888 create account eosio eosio.vpay VSC6Ef6bban2MbcgJAReN1Ai6ZdHkceUgeKgVBKSnpY8WCG2rWrwa
./clivsc --url http://27.155.88.190:8888 set contract eosio.token ../contracts/eosio.token;
./clivsc --url http://27.155.88.190:8888 set contract eosio.msig ../contracts/eosio.msig;
./clivsc --url http://27.155.88.190:8888 push action eosio.token create '["eosio", "1000000000.0000 VSC"]' -p eosio.token;
./clivsc --url http://27.155.88.190:8888 push action eosio.token issue '["eosio", "1000000000.0000 VSC", "memo"]' -p eosio;
./clivsc --url http://27.155.88.190:8888 set contract eosio ../contracts/eosio.system -x 3000;
./clivsc --url http://27.155.88.190:8888 push action eosio setpriv '["eosio.msig", 1]' -p eosio@active;
 ./clivsc --url http://27.155.88.190:8888 system newaccount --transfer eosio 114aaa VSC7TTwo4UdXMMjerdD4kmm3Vy9jbWCvtA1Z371PT8j4Ji46ArxYm --stake-net "10000000.0000 VSC" --stake-cpu "10000000.0000 VSC" --buy-ram "2000.0000 VSC"; 
./clivsc --url http://27.155.88.190:8888 transfer eosio 114aaa "2000.0000 VSC";
 ./clivsc --url http://27.155.88.190:8888 system newaccount --transfer eosio 155bbb VSC5jyNZ6VRyoKrQNS5cUCaUNJngA8qGf3xvmYRd1PGSbJsCihBMx --stake-net "10000000.0000 VSC" --stake-cpu "10000000.0000 VSC" --buy-ram "2000.0000 VSC"; 
./clivsc --url http://27.155.88.190:8888 transfer eosio 155bbb "2000.0000 VSC";
 ./clivsc --url http://27.155.88.190:8888 system newaccount --transfer eosio 154ccc VSC6mFuqKCus7PcE3fo7SJCzya9SbMCjraWzDQUuNzmv2kHxANbfs --stake-net "10000000.0000 VSC" --stake-cpu "10000000.0000 VSC" --buy-ram "2000.0000 VSC"; 
./clivsc --url http://27.155.88.190:8888 transfer eosio 154ccc "2000.0000 VSC";
 ./clivsc --url http://27.155.88.190:8888 system newaccount --transfer eosio usraaa VSC6Lt8rVTGcTe4AcGNPRMr55BuFufBobUPMqkFLvTEtXXGDsdKFp --stake-net "5000000.0000 VSC" --stake-cpu "5000000.0000 VSC" --buy-ram "2000.0000 VSC"; 
./clivsc --url http://27.155.88.190:8888 transfer eosio usraaa "2000.0000 VSC";
 ./clivsc --url http://27.155.88.190:8888 system newaccount --transfer eosio usrbbb VSC7UUsqBDrRSj16k9HUwKM49p48oWiaKytzPDarCB9ddbxADNaV9 --stake-net "5000000.0000 VSC" --stake-cpu "5000000.0000 VSC" --buy-ram "2000.0000 VSC"; 
./clivsc --url http://27.155.88.190:8888 transfer eosio usrbbb "2000.0000 VSC";
 ./clivsc --url http://27.155.88.190:8888 system newaccount --transfer eosio usrccc VSC7MFUNpPRMzksmLb7LWpADw91mh4WkMhzgGrvW4McHdcW5tzib8 --stake-net "5000000.0000 VSC" --stake-cpu "5000000.0000 VSC" --buy-ram "2000.0000 VSC"; 
./clivsc --url http://27.155.88.190:8888 transfer eosio usrccc "2000.0000 VSC";
./clivsc -u http://27.155.88.190:8888 system regproducer 114aaa VSC7TTwo4UdXMMjerdD4kmm3Vy9jbWCvtA1Z371PT8j4Ji46ArxYm
./clivsc -u http://27.155.88.190:8888 system regproducer 155bbb VSC5jyNZ6VRyoKrQNS5cUCaUNJngA8qGf3xvmYRd1PGSbJsCihBMx
./clivsc -u http://27.155.88.190:8888 system regproducer 154ccc VSC6mFuqKCus7PcE3fo7SJCzya9SbMCjraWzDQUuNzmv2kHxANbfs
./clivsc --url http://27.155.88.190:8888 system voteproducer prods usraaa 114aaa
./clivsc --url http://27.155.88.190:8888 system voteproducer prods usrccc 154ccc
./clivsc --url http://27.155.88.190:8888 system voteproducer prods usrbbb 155bbb
