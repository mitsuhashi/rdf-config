#!/bin/bash

# このファイルがあるディレクトリ
THIS_FILE_PATH=$(cd $(dirname $0); pwd)

# 環境変数を読み込む
source $THIS_FILE_PATH/env.sh

#
#  グラフごとのトリプル数を表示する
#
DATE=`date "+%Y%m%d_%H%M%S"`

docker exec $VIRT_DOCKER /root/show_load_errors.sh
