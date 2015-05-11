# Dockerfile

FROM debian:jessie

MAINTAINER ovwane 20150511

RUN apt-get install -y nginx
EXPOSE 80
EXPOSE 443
