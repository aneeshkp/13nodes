#!/bin/bash
if [ $# -ne 1 ]; then
    echo $0: usage: producer topic_name
    exit 1
fi
topic=$1
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH

~/librdkafka/src/rdkafka_performance4 -P -t $topic  -M -a -1 -b 10.19.110.7:9092,10.19.110.9:9092,10.19.110.11:9092 -c 5000   -l -s 64 -vvv
