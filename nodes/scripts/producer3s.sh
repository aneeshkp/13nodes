#!/bin/bash
#if [ $# -ne 1 ]; then
#    echo $0: usage: producer topic_name
#    exit 1
#fi
#topic=$1
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH
for var in "$@"
do
~/librdkafka/src/rdkafka_performance3 -P -t $var -p 1 -M -a -1 -b 10.19.110.7:9092,10.19.110.9:9092,10.19.110.11:9092   -B 1   -l > producer_topic_$var.txt 2>&1 &
done

#~/librdkafka/src/rdkafka_performance3 -P -t $topic -p 1 -M -a -1 -b 10.19.110.7:9092,10.19.110.9:9092,10.19.110.11:9092 -c 5000  -B 1  -r 2 -l -s 64
