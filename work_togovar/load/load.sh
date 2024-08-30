#!/bin/bash

# このファイルがあるディレクトリ
THIS_FILE_PATH=$(cd $(dirname $0); pwd)

# 環境変数を読み込む
source $THIS_FILE_PATH/env.sh

# ログの出力先ファイルを取得
#sudo mkdir -p logs 
#DATE=`date "+%Y%m%d_%H%M%S"`
#LOG="logs/load_${DATE}.log"

pre_processing() {
  docker exec $VIRT_DOCKER /root/pre_settings.sh  
}

load_rdf() {
  local DB=$1
  local GRAPH=$2
  local LOAD_DIR=$3
  local LD_DIR_FILE_MASK=$4

  docker exec $VIRT_DOCKER /root/load.sh $DB $GRAPH $LOAD_DIR $LD_DIR_FILE_MASK
}

post_processing() {
  docker exec $VIRT_DOCKER /root/post_settings.sh  
}

# 前処理
pre_processing

# データのロード
db=$1
graph=$2
load_dir=$3
ld_dir_file_mask=$4

echo load_rdf $db $graph $load_dir $ld_dir_file_mask
load_rdf $db $graph $load_dir $ld_dir_file_mask

# 後処理
post_processing

