FROM mysql:8.0.19

MAINTAINER eemp@edu.com

ENV TZ=Asia/Shanghai

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./mysql-min-5.7.sql /docker-entrypoint-initdb.d