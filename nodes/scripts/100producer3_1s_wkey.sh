#!/bin/bash
if [ $# -ne 1 ]; then
    echo $0: usage: producer topic_name
    exit 1
fi
topic=$1
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH
for i in {1..100};do
   key=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 5 | head -n 1);
   ~/rdkafka_performance3 -P -t $topic -k $key -M -a 0  -b 10.19.110.7:9092,10.19.110.9:9092,10.19.110.11:9092  -B 1 -r 1 -s 64000 -vvv  & 
done
