FROM tiredofit/alpine:3.13
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

ENV ENABLE_SMTP=FALSE \
    ZABBIX_HOSTNAME=docker-registry

RUN set -x && \
    apk update && \
    apk upgrade && \
    apk add \
        apache2-utils \
        git \
        && \
    \
    cd /usr/src && \
    git clone https://github.com/docker/distribution-library-image && \
    cp -R distribution-library-image/amd64/registry /bin && \
    chmod +x /bin/registry && \
    apk del git && \
    cd / && \
    rm -rf /var/cache/apk/* /usr/src/*

VOLUME ["/var/lib/registry"]

### Networking Configuration
EXPOSE 5000

### Add Files
ADD install /
