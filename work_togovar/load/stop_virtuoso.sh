#!/bin/bash

# このファイルがあるディレクトリ
THIS_FILE_PATH=$(cd $(dirname $0); pwd)

# 環境変数を読み込む
source $THIS_FILE_PATH/env.sh

#
#  現在ロード中のトリプルを表示する
#
docker exec $VIRT_DOCKER /root/stop.sh
