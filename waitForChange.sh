#!/bin/bash
echo $$ | tee /home/btccore/.bitcoin/bin/logs/my.$(basename $0).pid

while [ : ]
do
    date
    while [ $(find /mnt/volume_fra1_01/.bitcoin/blocks -mmin -2 -type f -name blk*.dat -exec ls -l {} + 2>/dev/null | wc -l) -eq 0 ]
	do
	  printf "."
	done
	clear
	date | tee -a newBlock.txt
	find /mnt/volume_fra1_01/.bitcoin/blocks -mmin -2 -type f -name blk*.dat | tee -a newBlock.txt
    sleep 10
done
