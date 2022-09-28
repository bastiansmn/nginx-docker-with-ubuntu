#!/bin/bash

docker stop nginx-server

docker volume create --name nginx-server-volume

docker build . -t nginx-server:nginx-server

# If a docker container named 'nginx-server' already exists, just start it
docker start nginx-server || docker run  \
   --name nginx-server \
   -d \
   -p 80:80 \
   -p 2222:22 \
   -v nginx-server-volume:/volume \
   nginx-server:nginx-server
