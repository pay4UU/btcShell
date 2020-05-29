#!/bin/bash
which=${1-btccore}

cat /home/btccore/.bitcoin/bin/basicCS | grep $which| cut -d " " -f2
