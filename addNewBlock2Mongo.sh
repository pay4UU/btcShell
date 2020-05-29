#!/bin/bash
echo $$ | tee /home/btccore/.bitcoin/bin/logs/my.$(basename $0).pid

rpcCred=$(cat basisRPC)
echo $rpcCred
while [ : ]
do
    index=$(bitcoin-cli $rpcCred getblockcount)
    echo "checking index " $index
    if [ $lastBlock -eq $index ]
    then
        echo "we are still at: " $lastBlock 
    else
        echo $(date) "new block num and date:" $index| tee -a newBlock.txt
	bc.getblockNV.sh $index | mg.import.sh
        lastBlock=$index        
    fi
    sleep 10
done
