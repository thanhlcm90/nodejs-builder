ARG VERSION=10.13.0
FROM  node:$VERSION-alpine
LABEL maintainer="Daniel Le <thanhlcm90@gmail.com>"

ADD https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 /usr/local/bin/dumb-init

RUN chmod +x /usr/local/bin/dumb-init

# Install yarn and other dependencies via apk
# --no-cache: download package index on-the-fly, no need to cleanup afterwards
# --virtual: bundle packages, remove whole bundle at once, when done
RUN apk --no-cache --virtual build-dependencies add \
    yarn \
    python \
    make \
    g++

RUN chown -R node:node /usr/local