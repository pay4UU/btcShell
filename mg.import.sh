#!/bin/bash
db=${2-btcCoreTesting}
coll=${1-blocksImported}

mongoimport  --db $db --collection $coll --authenticationDatabase $db --username "btccore" -p "btccore"
