#!/usr/bin/env bash

SERVICE=nodejs-app
MY_ACCOUNT=thanhlcm90
VERSION=8.16.0

docker rm -f $SERVICE
docker rmi -f $MY_ACCOUNT/$SERVICE

docker build -t $SERVICE .
IMAGE_ID=$(docker images -q $SERVICE)
docker tag $IMAGE_ID $MY_ACCOUNT/$SERVICE:$VERSION
docker tag $IMAGE_ID $MY_ACCOUNT/$SERVICE:latest

docker rmi $SERVICE