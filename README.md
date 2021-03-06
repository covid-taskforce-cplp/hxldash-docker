# hxldash-docker
**[draft] Unofficial dockerized version of HXLdash (_"Create data visualisations
quickly by leveraging the HXL - Humanitarian eXchange Language"_) for local
development. The hosted version (maintained by British Red Cross) is at
<https://hxldash.com/>**

The source code of hxldash is at <https://github.com/SimonbJohnson/quickX3>.

## Usage

> _TODO: remove non-relevant parts copied from https://github.com/fititnt/uwazi-docker_

The hxldash-docker requires docker-compose installed. See
requirements<sup>(To Do)</sup>. If you are a developer, can also check some
advanced information on development-instructions.md<sup>(To Do)</sup> and a
draft of production-instructions.md<sup>(To Do; Not planned)</sup>.

### Install

Run these commands on your terminal only the first time:

```bash
git clone https://github.com/covid-taskforce-cplp/hxldash-docker.git
cd hxldash-docker
# Install/Re-install from empty data
docker-compose run -e IS_FIRST_RUN=true --rm hxldash-docker 
```

### Run

### Without docker-compose
```bash
docker build -t hxldash .
docker run -it --rm --name hxldash-app hxldash -p 8000:8000
```

### With docker-compose
```bash
# Run uwazi on background (automatic restart on reboot unless stopped)
docker-compose up -d hxldash
```

Open your browser at <http://127.0.0.1:8000/>. <!-- Initial user: _admin_, password: _admin_. -->

<!--
docker build -t hxldash . && docker run -it --rm --name hxldash-app hxldash -p 7777:8000
docker build --no-cache -t hxldash . && docker run -it --rm --name hxldash-app hxldash -p 7777:8000
-->

### Basic docker commands

```bash


# Stop all containers from this uwazi-docker and do not restart again until you explicit ask for it
docker-compose stop

# Using "-d" param to run uwazi and its dependencies on background
docker-compose up -d hxldash

# No "-d" param, start uwazi, MongoDB & Elastic Search and see what is happening inside the containers
docker-compose up hxldash

# See what containers are running now
docker ps

# See all docker volumes
docker volume ls


# TODO: add commands specific to hxldash-docker

# # See docker volumes that stores data from uwazi-docker (hint: these ones to backup & restore)
# docker volume ls | grep 'mongodb_data1\|uploaded_documents'

# # Want some GUI to see what is happening on MongoDB? Use nosqlclient
# docker-compose up -d mongo-gui-mongoclient

# # Want some GUI to see what is happening on Elastic Search? Try Dejavu
# docker-compose up -d elasticsearch-gui-dejavu
```
### Commands for debug

```bash
# To log directly on a running container, in this case the hxldash
docker-compose exec hxldash bash

# To watch logs of all containers managed by this docker-compose.yml
docker-compose logs -f
```

<!--

Maybe:
- https://hub.docker.com/r/unocha/hxl-proxy
- https://hub.docker.com/_/traefik


Group of services (strategy)
- https://github.com/docker/compose/issues/2589#issuecomment-313796200

-->

## Docker image

### To use pre-build docker images

See <https://hub.docker.com/r/covidtaskforcecplp/hxldash>.

### Upload image do Docker Hub

If you have access to the organization <https://hub.docker.com/u/covidtaskforcecplp>, you can build locally and publish with this command:


```bash
docker build -t covidtaskforcecplp/hxldash .
docker push covidtaskforcecplp/hxldash
```

## License

[![Public Domain](https://i.creativecommons.org/p/zero/1.0/88x31.png)](UNLICENSE)

To the extent possible under law, the authors of [@covid-taskforce-cplp](https://github.com/covid-taskforce-cplp)
waived all copyright and related or neighboring rights to this work to
[Public Domain](UNLICENSE).