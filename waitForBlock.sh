#!/bin/bash
echo $$ | tee /home/btccore/.bitcoin/bin/logs/my.$(basename $0).pid

while [ : ]
do
    index=$(bitcoin-cli -rpcuser=btccore -rpcpassword=btccore getblockcount)
    echo "checking index " $index
    if [ $lastBlock -eq $index ]
    then
        echo "we are still at: " $lastBlock 
    else
        echo $(date) "new block num and date:" $index| tee -a newBlock.txt
        lastBlock=$index        
    fi
    sleep 10
done
