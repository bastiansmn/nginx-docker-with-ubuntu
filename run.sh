#!/bin/bash

docker volume create nginx-server-volume

docker build . -t nginx-server:nginx-server

docker run  \
   --name nginx-server \
   -d \
   -p 80:80 \
   -p 2222:22 \
   -v nginx-sever-volume:/volume \
   nginx-server:nginx-server
