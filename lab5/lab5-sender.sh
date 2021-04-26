#!/bin/bash

if [ "$#" -eq 0 ]; then 
DATASET=/logs/web.log
TIME=1
TOPIC=weblog
elif [ "$#" -eq 1 ]; then 
DATASET=$1
TIME=60
TOPIC=weblog
elif [ "$#" -eq 2 ]; then 
DATASET=$1
TIME=$2
TOPIC=weblog
else
DATASET=$1
TIME=$2
TOPIC=$3
fi

[ ! "$(docker network ls | grep psnet )" ] && \
	docker network create --driver=bridge --subnet=10.123.0.0/16 psnet

docker run --rm --name=publisher --network=psnet smduarte/ps2021-logsender-v2:latest $TIME $DATASET $TOPIC
