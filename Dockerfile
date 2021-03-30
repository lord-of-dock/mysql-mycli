# This dockerfile uses extends image https://hub.docker.com/sinlov/go-micro-cli
# VERSION 1
# Author: sinlov
# dockerfile offical document https://docs.docker.com/engine/reference/builder/
# https://hub.docker.com/_/python?tab=tags&page=1&ordering=last_updated&name=3.9
FROM python:3.9.2-slim

RUN pip install -U mycli --no-cache-dir

ADD docker-entrypoint.sh /usr/local/bin/

# WORKDIR /usr/src/

# EXPOSE 9090
# ENV MYCLI_MYSQL_HOST=0.0.0.0
# CMD echo $MYCLI_MYSQL_HOST
# CMD which mycli
# CMD ["tail",  "-f", "/etc/alpine-release"]

# ENTRYPOINT [ "/usr/local/bin/mycli" ]
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mycli"]