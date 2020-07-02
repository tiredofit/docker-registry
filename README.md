# hub.docker.com/r/tiredofit/registry

[![Build Status](https://img.shields.io/docker/build/tiredofit/registry.svg)](https://hub.docker.com/r/tiredofit/registry)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/registry.svg)](https://hub.docker.com/r/tiredofit/registry)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/registry.svg)](https://hub.docker.com/r/tiredofit/registry)
[![Docker Layers](https://images.microbadger.com/badges/image/tiredofit/registry.svg)](https://microbadger.com/images/tiredofit/registry)


## Introduction

This will build a Docker container for Docker Registry 
        
This Container uses [tiredofit:alpine:3.12](https://hub.docker.com/r/tiredofit/alpine) as a base.


[Changelog](CHANGELOG.md)

## Authors

- [Dave Conroy](https://github.com/tiredofit)

## Table of Contents

- [Introduction](#introduction)
    - [Changelog](CHANGELOG.md)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
    - [Networking](#networking)
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

## Prerequisites

This image assumes that you are using a reverse proxy such as 
[jwilder/registry-proxy](https://github.com/jwilder/registry-proxy) and optionally the [Let's Encrypt Proxy 
Companion @ 
https://github.com/JrCs/docker-letsencrypt-registry-proxy-companion](https://github.com/JrCs/docker-letsencrypt-registry-proxy-companion) 
in order to serve your pages. However, it will run just fine on it's own if you map appropriate ports.


## Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/registry) and is the recommended method of installation.


```bash
docker pull tiredofit/registry
```

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.
* Make [networking ports](#networking) available for public access if necessary



## Configuration

### Data-Volumes

The following directories are used for configuration and can be mapped for persistent storage.

| Directory    | Description                                                 |
|--------------|-------------------------------------------------------------|
|  `/var/lib/registry` | Images |
| `/var/log/registry` | Logs (Optional)

### Environment Variables


### Networking

The following ports are exposed.

| Port      | Description |
|-----------|-------------|
| `5000`    | Registry    |


## Maintenance
### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. registry) bash
```

## References

* https://docker.com/




