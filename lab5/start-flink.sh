#!/bin/bash

[ ! "$(docker network ls | grep psnet )" ] && \
	docker network create --driver=bridge --subnet=10.123.0.0/16 psnet

docker pull smduarte/ps2021-kafka

echo "Launching Apache Flink:"
echo "open in browser: http://localhost:3000/wetty"
echo "user: flink, pass: flink"

docker rm -f flink 

docker run -h flink  \
	--name flink \
	--network=psnet \
        --rm \
	-d -p 3000:3000 smduarte/ps2021-flink 
