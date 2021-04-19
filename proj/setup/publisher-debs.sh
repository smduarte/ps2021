#!/bin/bash

if [ "$#" -eq 0 ]; then 
TIME=60
elif [ "$#" -eq 1 ]; then 
TIME=$1
fi

[ ! "$(docker network ls | grep psnet )" ] && \
	docker network create --driver=bridge --subnet=10.123.0.0/16 psnet

docker pull smduarte/ps2021-tp1-publisher

docker run --rm --name=publisher --network=psnet -v "$(pwd)/logs":/debs smduarte/ps2021-tp1-publisher 
