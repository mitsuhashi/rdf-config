#!/bin/sh

#
# グラフ毎のトリプル数を表示する 
# See ://dbcls.rois.ac.jp/~yayamamo/fsyl/2013/08/%E3%83%88%E3%83%AA%E3%83%97%E3%83%AB%E3%82%B9%E3%83%88%E3%82%A2%E5%86%85%E3%81%AE%E6%83%85%E5%A0%B1%E3%82%92%E5%BE%97%E3%82%8B%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%82%AF%E3%82%A8%E3%83%AA%E9%9B%86/ 
#

isql 1111 dba dba exec="SPARQL SELECT DISTINCT ?g (COUNT(?s) AS ?gcount) { GRAPH ?g {?s ?p ?o} } GROUP BY ?g ORDER BY DESC (?gcount);" 

