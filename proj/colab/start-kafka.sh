#!/bin/bash
echo $*

KAFKA=kafka_2.12-2.7.0

./$KAFKA/bin/zookeeper-server-stop.sh
./$KAFKA/bin/kafka-server-stop.sh 

echo "Starting Zookeeper..."
./$KAFKA/bin/zookeeper-server-start.sh -daemon ./$KAFKA/config/zookeeper.properties
echo "Starting Kafka..."
./$KAFKA/bin/kafka-server-start.sh -daemon ./$KAFKA/config/server.properties
echo "Waiting for 10 secs until kafka and zookeeper services are up and running"
sleep 10

nohup java -cp /tmp/PS2021-Debs-Publisher.jar debs.Publisher $* &>/tmp/debs.log &
