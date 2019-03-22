#!/bin/bash  
echo `date` >> testok.log;
curl  http://27.155.88.241:8888/v1/chain/get_currency_balance -X POST -d '{"code":"eosio.token","account":"usraaa","symbol":"SYS"}' >> testok.log; 
times=1;
for((i=1;i<=1000;i++));  
do   
	chainid=`curl  --url http://27.155.88.241:8888/v1/chain/get_info | awk -F '","' '{print $2}' | awk -F '":"' '{print $2}'` ;
	echo $chainid is chainid ;
	last_irreversible_block_num=`curl  --url http://27.155.88.241:8888/v1/chain/get_info | awk -F '","' '{print $3}' | awk -F',"' '{print $2}' | awk -F: '{print $2}'`;
	echo $last_irreversible_block_num is last_irreversible_block_num;
	ref_block_prefix=`curl  --url http://27.155.88.241:8888/v1/chain/get_block -X POST -d '{"block_num_or_id":"'${last_irreversible_block_num}'"}'  | awk -F 'ref_block_prefix' '{print $2}' | awk -F ':' '{print $2}' | awk -F '}' '{print $1}'`;
	echo $ref_block_prefix is ref_block_prefix ;

	expiration=`date +'%Y-%m-%dT%H:%M:%S.000' -d '+5 hours'`;

	publish_key=`curl  --url http://27.155.88.241:8888/v1/chain/get_account -X POST -d '{"account_name": "usraaa"}' | awk -F '"key":"' '{print $2}' | awk -F '","weight' '{print $1}'`;
	echo "$publish_key is publish_key";
	
	transfer_data=`curl  --url http://27.155.88.241:8888/v1/chain/abi_json_to_bin -X POST -d '{"code":"eosio.token","action":"transfer","args":{"from":"usraaa","to":"gxy111111113","quantity":"0.0100 SYS", "memo":"hi there"}}' | awk -F '"' '{print $4}'`;
	echo "${transfer_data} is transfer_data";

	SIG_K1=$(curl  --url http://27.155.88.241:8889/v1/wallet/sign_transaction -X POST -d '[{"expiration":"'${expiration}'","ref_block_num":'${last_irreversible_block_num}',"ref_block_prefix":'${ref_block_prefix}',"max_net_usage_words":0,"max_cpu_usage_ms":0,"delay_sec":0,"context_free_actions":[],"actions":[{"account":"eosio.token","name":"transfer","authorization":[{"actor":"usraaa","permission":"active"}],"data":"'${transfer_data}'"}],"transaction_extensions":[],"signatures":[],"context_free_data":[]},["'${publish_key}'"],"cf057bbfb72640471fd910bcb67639c22df9f92470936cddc1ade0e2f2e7dc4f"]' | awk -F '"' '{print $(NF-3)}');
	echo $SIG_K1 is SIG_K1;
	echo "===========${SIG_K1:0:6}===================";
	if [ "${SIG_K1:0:6}" == "SIG_K1" ];then
		echo "sign_transaction ok ";
	else
		echo "--------------sign_transaction eeror ---------";
		echo "curl  --url http://27.155.88.241:8889/v1/wallet/sign_transaction -X POST -d '[{\"expiration\":\"${expiration}\",\"ref_block_num\":${last_irreversible_block_num},\"ref_block_prefix\":${ref_block_prefix},\"max_net_usage_words\":0,\"max_cpu_usage_ms\":0,\"delay_sec\":0,\"context_free_actions\":[],\"actions\":[{\"account\":\"eosio.token\",\"name\":\"transfer\",\"authorization\":[{\"actor\":\"usraaa\",\"permission\":\"active\"}],\"data\":\"${transfer_data}\"}],\"transaction_extensions\":[],\"signatures\":[],\"context_free_data\":[]},[\"${publish_key}\"],\"cf057bbfb72640471fd910bcb67639c22df9f92470936cddc1ade0e2f2e7dc4f\"]" >> testerror.log;
		echo "--------------sign_transaction eeror ---------";
		SIG_K1_erro=`curl  --url http://27.155.88.241:8889/v1/wallet/sign_transaction -X POST -d '[{"expiration":"'${expiration}'","ref_block_num":'${last_irreversible_block_num}',"ref_block_prefix":'${ref_block_prefix}',"max_net_usage_words":0,"max_cpu_usage_ms":0,"delay_sec":0,"context_free_actions":[],"actions":[{"account":"eosio.token","name":"transfer","authorization":[{"actor":"usraaa","permission":"active"}],"data":"'${transfer_data}'"}],"transaction_extensions":[],"signatures":[],"context_free_data":[]},["'${publish_key}'"],"cf057bbfb72640471fd910bcb67639c22df9f92470936cddc1ade0e2f2e7dc4f"]'`;
		echo "time=$i=====errorinfo ${SIG_K1_erro}" >> testerror.log;
	fi
	

	tranfer_id=`curl  --url http://27.155.88.241:8888/v1/chain/push_transaction -X POST -d '{"compression":"none","transaction":{"expiration":"'${expiration}'","ref_block_num":'${last_irreversible_block_num}',"ref_block_prefix":'${ref_block_prefix}',"context_free_actions":[],"actions":[{"account":"eosio.token","name":"transfer","authorization":[{"actor":"usraaa","permission":"active"}],"data":"'${transfer_data}'"}],"transaction_extensions":[]},"signatures":["'${SIG_K1}'"]}' | awk -F '"' '{print $4}' `;
	echo $tranfer_id;
	if [ "${SIG_K1:0:6}" == "SIG_K1" ] && [ "${tranfer_id}" != "message" ];then
	 echo "time=${times},transaction_id=$tranfer_id" >> testok.log;
	 ((times++));
	fi
	echo "curl  --url http://27.155.88.241:8888/v1/chain/push_transaction -X POST -d '{\"compression\":\"none\",\"transaction\":{\"expiration\":\"${expiration}\",\"ref_block_num\":${last_irreversible_block_num},\"ref_block_prefix\":${ref_block_prefix},\"context_free_actions\":[],\"actions\":[{\"account\":\"eosio.token\",\"name\":\"transfer\",\"authorization\":[{\"actor\":\"usraaa\",\"permission\":\"active\"}],\"data\":\"${transfer_data}\"}],\"transaction_extensions\":[]},\"signatures\":[\"${SIG_K1}\"]}'"
	echo $tranfer_id is tranfer_id;
	sleep 1;
done  

curl  http://27.155.88.241:8888/v1/chain/get_currency_balance -X POST -d '{"code":"eosio.token","account":"usraaa","symbol":"SYS"}' >> testok.log; 
echo `date` >> testok.log;
