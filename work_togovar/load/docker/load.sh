#!/bin/bash

#
# $DBのRDFファイルをvirtuosoにロードし$graphをグラフ名にする
#

DB=$1
GRAPH=$2
LOAD_DIR=$3
LD_DIR_FILE_MASK=$4

#
# データロード
#
echo '====================================================================' 
echo "START: `date`"
echo "DB: $DB URL: $URL"
echo "LOAD: $LOAD_DIR into $GRAPH" 

# ロードするRDFファイルのディレクトリを指定する
#isql 1111 dba dba verbose=off exec="log_enable(2,1); ld_dir_all('$LOAD_DIR', '$LD_DIR_FILE_MASK', '$GRAPH');" 
isql 1111 dba dba verbose=off exec="log_enable(2,1); ld_dir('$LOAD_DIR', '$LD_DIR_FILE_MASK', '$GRAPH');" 
isql 1111 dba dba verbose=off exec="SELECT * FROM DB.DBA.LOAD_LIST WHERE ll_graph='$GRAPH';"

#  rdf_loader_run()を4プロセス同時に実行し、最後の1プロセスが終了するまでまつ
isql 1111 dba dba verbose=off exec="rdf_loader_run();" &
isql 1111 dba dba verbose=off exec="rdf_loader_run();" &
isql 1111 dba dba verbose=off exec="rdf_loader_run();" &
isql 1111 dba dba verbose=off exec="rdf_loader_run();" &
wait

echo "Finished: `date`"
echo '===================================================================='
