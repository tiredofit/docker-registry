FROM docker.io/tiredofit/alpine:3.17
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ENV DOCKER_REGISTRY_VERSION=v2.8.1 \
    DOCKER_REGISTRY_SOURCE_REPO=https://github.com/distribution/distribution/ \
    CONTAINER_ENABLE_MESSAGING=FALSE \
    IMAGE_NAME="tiredofit/registry" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-registry/"

RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add -t .registry-build-deps \
            git \
            go \
            make \
            && \
    apk add -t .registry-run-deps \
        apache2-utils \
        && \
    \
    git clone ${DOCKER_REGISTRY_SOURCE_REPO} /usr/src/docker-registry && \
    CGO_ENABLED=0 make -C /usr/src/docker-registry && \
    cp -R /usr/src/docker-registry/bin/registry /usr/sbin && \
    apk del .registry-build-deps && \
    rm -rf /root/.cache \
           /usr/src/* \
           /var/cache/apk/*

VOLUME ["/var/lib/registry"]

### Networking Configuration
EXPOSE 5000

### Add Files
COPY install /
