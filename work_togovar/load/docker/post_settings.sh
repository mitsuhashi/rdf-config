#!/bin/sh
cd /root

echo "POST SETTING  START: `date`"

#checkpoint
isql 1111 dba dba exec="checkpoint;"
isql 1111 dba dba exec="commit work;"
isql 1111 dba dba exec="checkpoint;"

#re-enable indexing  indexingは使わない
#isql 1111 dba dba exec="DB.DBA.RDF_OBJ_FT_RULE_ADD (null, null, 'All');" 
#isql 1111 dba dba exec="DB.DBA.VT_INC_INDEX_DB_DBA_RDF_OBJ ();"

# Set Predefined Namespace Prefixes
isql 1111 dba dba exec="DB.DBA.XML_SET_NS_DECL ('dcterms', 'http://purl.org/dc/terms/', 2);" 

# デフォルトのoboの設定を消す
isql 1111 dba dba exec="DB.DBA.XML_REMOVE_NS_BY_PREFIX('obo', 2);" 
isql 1111 dba dba exec="DB.DBA.XML_SET_NS_DECL ('obo', 'http://purl.obolibrary.org/obo/', 2);" 

isql 1111 dba dba exec="DB.DBA.XML_SET_NS_DECL ('qudt', 'http://qudt.org/schema/qudt/', 2);" 
isql 1111 dba dba exec="DB.DBA.XML_SET_NS_DECL ('prov', 'http://www.w3.org/ns/prov#', 2);"
isql 1111 dba dba exec="DB.DBA.XML_SET_NS_DECL ('pav', 'http://purl.org/pav/', 2);"

echo "POST SETTING Finished: `date`"
