#!/bin/sh

# 引数チェック
if [ $# != 1 ]; then
  echo "ERROR: Take one argument. sh post_clear_graph.sh <GRAPH>" 1>&2
  exit 1
fi

GRAPH=$1

echo "START: `date`"
echo "DELETE FROM LOAD_LIST: $GRAPH" 
isql 1111 dba dba exec="DELETE FROM DB.DBA.LOAD_LIST WHERE ll_graph = '$GRAPH';"
wait
echo "Finished: `date`"
