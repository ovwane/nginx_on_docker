# Dockerfile

FROM ubuntu:14.04

MAINTAINER ovwane 20150511

RUN apt-get install -y nginx openssh-server sudo && rm -rf /var/lib/apt/lists/* && echo "\ndaemon off;" >> /etc/nginx/nginx.conf && chown -R www-data:www-data /var/lib/nginx
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN useradd ovwane
RUN echo "ovwane:ovwane" | chpasswd
RUN echo "ovwane   ALL=(ALL)       ALL" >> /etc/sudoers
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
RUN mkdir /var/run/sshd
ADD run.sh /run.sh
RUN chmod 755 /*.sh

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx"]

WORKDIR /etc/nginx

CMD ["/run.sh"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
