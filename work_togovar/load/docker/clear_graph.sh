#!/bin/sh

# 引数チェック
if [ $# != 1 ]; then
  echo "ERROR: Take one argument. sh clear_graph.sh <GRAPH>" 1>&2
  exit 1
fi

GRAPH=$1

echo "START: `date`"
echo "CLEAR GRAPH: $GRAPH" 
isql 1111 dba dba exec="log_enable(3,1);" 
isql 1111 dba dba exec="SPARQL CLEAR GRAPH <$GRAPH>;"
wait
echo "Finished: `date`"
