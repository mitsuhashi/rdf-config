#!/bin/bash

isql 1111 dba dba exec="SPARQL SELECT DISTINCT ?g (COUNT(?s) AS ?gcount) { GRAPH ?g {?s ?p ?o} } GROUP BY ?g ORDER BY ?g"
