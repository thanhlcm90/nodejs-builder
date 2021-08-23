#!/usr/bin/env bash

SERVICE=nodejs-builder
MY_ACCOUNT=thanhlcm90
VERSION=14.17.5

docker rm -f $SERVICE
docker rmi -f $MY_ACCOUNT/$SERVICE

docker build -t $SERVICE .
IMAGE_ID=$(docker images -q $SERVICE)
docker tag $IMAGE_ID $MY_ACCOUNT/$SERVICE:$VERSION
docker tag $IMAGE_ID $MY_ACCOUNT/$SERVICE:latest

docker push $MY_ACCOUNT/$SERVICE:latest
docker push $MY_ACCOUNT/$SERVICE:$VERSION

docker rmi $SERVICE