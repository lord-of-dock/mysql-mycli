# mysql-mycli

[![docker build](https://img.shields.io/docker/cloud/build/sinlov/mysql-mycli)](https://hub.docker.com/r/sinlov/mysql-mycli)
[![docker version semver](https://img.shields.io/docker/v/sinlov/mysql-mycli?sort=semver)](https://hub.docker.com/r/sinlov/mysql-mycli/tags?page=1&ordering=last_updated)
[![docker image size](https://img.shields.io/docker/image-size/sinlov/mysql-mycli)](https://hub.docker.com/r/sinlov/mysql-mycli)

- docker hub see https://hub.docker.com/r/sinlov/mysql-mycli

## mycl document

- source [https://github.com/dbcli/mycli](https://github.com/dbcli/mycli)

## image useage

```sh
docker run --rm -it \
  --name mysql-mycli \
  sinlov/mysql-mycli:latest --version
```

### as shell use

- latest

```bash
$ sudo curl -s -L --fail https://raw.githubusercontent.com/lord-of-dock/mysql-mycli/main/latest/run.sh -o /usr/local/bin/mycli
$ sudo chmod +x /usr/local/bin/mycli
$ mycli --version
```

- 1.24.1

```bash
$ sudo curl -s -L --fail https://raw.githubusercontent.com/lord-of-dock/mysql-mycli/main/1.24.1/run.sh -o /usr/local/bin/mycli
$ sudo chmod +x /usr/local/bin/mycli
```

## docker-compose

```yml
# copy right
# Licenses http://www.apache.org/licenses/LICENSE-2.0
# more info see https://docs.docker.com/compose/compose-file/ or https://docker.github.io/compose/compose-file/
version: '3.7'
networks:
  default:
services:
  star-signal:
    container_name: 'mysql-mycli'
    image: sinlov/mysql-mycli:1.24.1-slim # https://hub.docker.com/r/sinlov/mysql-mycli/tags?page=1&ordering=last_updated
    environment:
      - MYCLI_MYSQL_HOST=0.0.0.0
      - MYCLI_MYSQL_DATABASE=dbtest
      # - MYCLI_MYSQL_ROOT_PASSWORD=xxx # if use MYCLI_MYSQL_ROOT_PASSWORD do not use MYCLI_MYSQL_USER and MYCLI_MYSQL_PASSWORD
      - MYCLI_MYSQL_USER=myuser
      - MYCLI_MYSQL_PASSWORD=password
```