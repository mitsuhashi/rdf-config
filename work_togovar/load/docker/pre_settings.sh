#!/bin/sh

#cd /root
echo "PRE SETTING START: `date`"

# Enable service phrase
# See https://wiki.lifesciencedb.jp/mw/SPARQLthon20/FederatedQueryTips
# See https://community.openlinksw.com/t/enabling-sparql-1-1-federated-query-processing-in-virtuoso/2477
isql 1111 dba dba verbose=off exec="revoke \"SPARQL_SELECT_FED\" from \"SPARQL\";"
isql 1111 dba dba verbose=off exec="grant \"SPARQL_SELECT_FED\" to \"SPARQL\";"
isql 1111 dba dba verbose=off exec="revoke \"SPARQL_LOAD_SERVICE_DATA\" from \"SPARQL\";"
isql 1111 dba dba verbose=off exec="grant \"SPARQL_LOAD_SERVICE_DATA\" to \"SPARQL\";"

# Disable indexing
# See https://drive.google.com/drive/folders/1WTQ_QS_JcttXTc9hTlaf-ap2p57WmP9V 
isql 1111 dba dba verbose=off exec="DB.DBA.RDF_OBJ_FT_RULE_DEL(null, null, 'ALL');"

echo "PRE SETTING Finished: `date`"
