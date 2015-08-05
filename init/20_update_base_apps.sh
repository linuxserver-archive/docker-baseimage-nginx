#!/bin/bash

apt-get update -qq
apt-get --only-upgrade install \
nginx \
openssl \
php5-fpm \
php5-mysql \
php5-cli \
php5 \
php5-mcrypt \
php5-curl -qqy
