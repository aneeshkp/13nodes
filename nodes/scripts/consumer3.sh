#!/bin/bash
if [ $# -ne 1 ]; then
    echo $0: usage: producer topic_name
    exit 1
fi
topic=$1
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH
~/librdkafka/src/rdkafka_performance3 -C -t $topic  -p 1  -o end -b 10.19.110.7:9092,10.19.110.9:9092,10.19.110.11:9092  -u -l > CONSUMER_$topic.txt 2>&1 &
