# NodeJS MongoDB Redis Image which contains an environment for NodeJS app ecosystem

FROM ubuntu:14.04
MAINTAINER Daniel Le <thanhlcm90@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# update apt and prepare importance package
RUN apt-get update -y && apt-get install -y curl build-essential software-properties-common git

# prepare for mongodb
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# prepare for redis
RUN add-apt-repository ppa:chris-lea/redis-server

# prepare for python 2.7
RUN add-apt-repository ppa:fkrull/deadsnakes

# add sources list for mongodb 3.2
RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# install python 2.7 nodejs, mongodb, redis
RUN mkdir -p /data/db
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y python2.7 nodejs mongodb-org tcl8.5 redis-server

# install node node-gyp
RUN npm install -g node-gyp

# link python2.7
RUN ln -s /usr/bin/python2.7 /usr/bin/python

# Start MongoDB & Redis
CMD mongod --fork -f /etc/mongod.conf \
 && redis-server /etc/redis/redis.conf \
 && bash