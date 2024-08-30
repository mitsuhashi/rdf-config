#!/bin/bash
#
# RDFをvirtuosoにロードする
#

DATE=`date "+%Y%m%d_%H%M%S"`

# データのロード
db=togovar
graph=http://togovar.org/mogplus
load_dir=/rdf_data/$db
ld_dir_file_mask="*.jsonld"

LOG="logs/load_${db}_${DATE}.log"

nohup ./load.sh $db $graph $load_dir $ld_dir_file_mask >& $LOG &

db=mogplus
graph=http://togovar.org/mogplus
load_dir=/rdf_data/$db
ld_dir_file_mask="*.jsonld"

LOG="logs/load_${db}_${DATE}.log"

nohup ./load.sh $db $graph $load_dir $ld_dir_file_mask >& $LOG &

