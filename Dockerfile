ARG VERSION=22.11.0
FROM  node:$VERSION-alpine
LABEL maintainer="Daniel Le <thanhlcm90@gmail.com>"

# Install yarn and other dependencies via apk
# --no-cache: download package index on-the-fly, no need to cleanup afterwards
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --update alpine-sdk && apk --no-cache add \
    libc6-compat \
    yarn \
    python3 \
    build-base \
    git

RUN chown -R node:node /usr/local