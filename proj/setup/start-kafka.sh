#!/bin/bash

[ ! "$(docker network ls | grep ps-net )" ] && \
	docker network create --driver=bridge --subnet=10.123.0.0/16 ps-net

docker pull smduarte/ps2021-kafka

echo "Launching Kafka Server: "

docker rm -f kafka

docker run -h kafka  \
	--name=kafka \
	--network=ps-net \
	--rm -t -p 9092:9092 -p 2181:2181 smduarte/ps2021-kafka
