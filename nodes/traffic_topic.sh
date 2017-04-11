sh kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 3 --config retention.ms 12000 --topic telemetry_topic
