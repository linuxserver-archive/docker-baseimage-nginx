FROM linuxserver/baseimage
MAINTAINER smdion <me@seandion.com>
MAINTAINER Mark Burford <sparklyballs@gmail.com>

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV TERM screen

# expose ports
EXPOSE 80
EXPOSE 443

# remove ssh
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# set volume
VOLUME /config

# update apt and install nginx
RUN apt-get update && \
apt-get install \
nginx \
php5-fpm \
php5-mysql \
php5 \
inotify-tools -y && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/*

#Adduser abc
RUN useradd -u 911 -U -s /bin/false abc
RUN usermod -G users abc

#Adding Custom files
ADD defaults/nginx.conf /root/config-files/nginx.conf 
ADD defaults/nginx-fpm.conf /root/config-files/nginx-fpm.conf
ADD services/ /etc/service/
ADD init/ /etc/my_init.d/
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh
