#!/bin/bash
if [ $# -ne 2 ]; then
 echo $0: usage: producer topic_name  group_name
    exit 1
fi
topic=$1
group =$2
echo $group
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH
~/librdkafka/src/rdkafka_performance4 -C -t $1 -p 0 -o end -b 10.19.110.7:9092,10.19.110.9:9092,10.19.110.11:9092 -u -l 
