#!/bin/bash
if [ $# -ne 1 ]; then
    echo $0: usage: producer topic_name
    exit 1
fi
topic=$1
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH

~/librdkafka/src/rdkafka_performance3 -P -t $topic -M -a 0  -b 10.19.110.7:9092,10.19.110.9:9092,10.19.110.11:9092  -B 1 -r 5 -s 64000 -vvv 
 
#> PRODUCER_$topic.txt 2>&1 
