#!/bin/bash
date > /tngbench_share/start.txt

while true;
do
 case "$1"
 in
 mp.input) shift;INPUT=$1;;
 mp.output1) shift;OUTPUT1=$1;;
 mp.output2) shift;OUTPUT2=$1;;
 vnf) shift;VNF=$1;;
 esac
 shift;
 if [ "$1" = "" ]; then
  break
 fi
done

sed -i 's/VNF/'"bind = "$VNF:3000""'/g' /etc/gobetween/conf/gobetween.toml
sed -i 's/SERVER1/'"$OUTPUT1:80 weight=50 priority=0"'/g' /etc/gobetween/conf/gobetween.toml
sed -i 's/SERVER2/'"$OUTOUT2:80 weight=50 priority=0"'/g' /etc/gobetween/conf/gobetween.toml

sleep 10
echo "Server added"

gobetween -c /etc/gobetween/conf/gobetween.toml 
