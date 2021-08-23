ARG VERSION=14.17.5
FROM  node:$VERSION-alpine
LABEL maintainer="Daniel Le <thanhlcm90@gmail.com>"

# Install yarn and other dependencies via apk
# --no-cache: download package index on-the-fly, no need to cleanup afterwards
RUN apk add --update alpine-sdk && apk --no-cache add \
    yarn \
    python \
    build-base

# Update latest npm
RUN npm install -g npm@7.20.1

RUN chown -R node:node /usr/local