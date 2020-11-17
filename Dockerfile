ARG VERSION=10.23.0
FROM  node:$VERSION-alpine
LABEL maintainer="Daniel Le <thanhlcm90@gmail.com>"

# Install yarn and other dependencies via apk
# --no-cache: download package index on-the-fly, no need to cleanup afterwards
RUN apk --no-cache add \
    yarn \
    python \
    make \
    g++

RUN chown -R node:node /usr/local