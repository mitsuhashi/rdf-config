#!/bin/sh

#
# ロード中のRDFファイルを表示する
# See https://wiki.lifesciencedb.jp/mw/SPARQLthon19/TripleLoad
# 
#  SQL> SELECT * FROM DB.DBA.LOAD_LIST;//ロード対象のファイル一覧
#  SQL> SELECT COUNT(*) FROM DB.DBA.LOAD_LIST where ll_state = 0; //未ロードのファイル一覧。0:未着手、1:ロード中、2:ロード済み
#  SQL> SELECT * FROM DB.DBA.LOAD_LIST WHERE ll_error IS NOT NULL; //syntax等でロードエラーが出たファイルの一覧
#

isql 1111 dba dba exec="select * from db.dba.load_list where ll_started = 2;" 

