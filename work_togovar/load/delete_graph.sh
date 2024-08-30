#!/bin/bash

# このファイルがあるディレクトリ
THIS_FILE_PATH=$(cd $(dirname $0); pwd)

# 環境変数を読み込む
source $THIS_FILE_PATH/env.sh

cwd="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $cmd

if [ $# -lt 1 ]; then
  echo "ERROR: Take at least 1 argument. delete_graph.sh <GRAPH> (<SID>)" 1>&2
  exit 1
fi
GRAPH=$1

# ログの出力先ファイルを取得
#sudo mkdir -p logs
#DATE=`date "+%Y%m%d_%H%M%S"`
#LOG="logs/load_${DATE}.log"

docker exec $VIRT_DOCKER /root/clear_graph.sh $GRAPH
docker exec $VIRT_DOCKER /root/post_clear_graph.sh $GRAPH

echo "DELETE <$GRAPH> FINISHED: `date`"
