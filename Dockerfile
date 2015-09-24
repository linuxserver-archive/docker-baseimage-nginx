FROM linuxserver/baseimage
MAINTAINER smdion <me@seandion.com>, Mark Burford <sparklyballs@gmail.com>, Stian Larsen <lonix@linuxserver.io>, Kode <kodestar@linuxserver.io>
ENV BASE_APTLIST="nginx openssl php5-fpm php5 php5-cli"
RUN apt-get update && \
apt-get install $BASE_APTLIST -qy && \
apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /defaults
ADD defaults/ /defaults/ 
ADD services/ /etc/service/
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh
EXPOSE 80 443
VOLUME /config
