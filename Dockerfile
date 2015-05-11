# Dockerfile

FROM debian:jessie

MAINTAINER ovwane 20150511

RUN apt-get install -y nginx && rm -rf /var/lib/apt/lists/* && echo "\ndaemon off;" >> /etc/nginx/nginx.conf && chown -R www-data:www-data /var/lib/nginx

ADD run.sh /run.sh
RUN chmod 755 /*.sh

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

WORKDIR /etc/nginx

CMD ["/run.sh"]

EXPOSE 80
EXPOSE 443
