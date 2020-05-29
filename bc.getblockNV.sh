#!/bin/bash
index=${1-0}
echo $index ":" $(date) 1>&2
hash=$(bitcoin-cli getblockhash $index)

coinbase=$(bitcoin-cli getblock $hash 2 | jsontool tx[0].vin[0].coinbase)
minedBy=$(echo $coinbase| xxd -p -r | sed 's/\x0//g' | tr -dc '[[:print:]]'| tr -d "'")| tr -d "\""
reward=$(bitcoin-cli getblock $hash 2| jsontool tx[0].vout[0].value)

bitcoin-cli getblock $hash| jsontool -e "this.tx=0;this.index='$index'"|egrep "{|}|index|hash|time|difficulty|nTx"|jsontool -e "this.coinbase='$coinbase';this.minedBy='$minedBy';this.reward='$reward'"

