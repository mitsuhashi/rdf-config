#!/bin/sh

isql 1111 dba dba exec="checkpoint;"
isql 1111 dba dba -K
