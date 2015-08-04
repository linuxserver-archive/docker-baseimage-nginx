#!/bin/bash

apt-get update -qq
apt-get --only-upgrade install \
nginx \
php5-fpm \
php5-mysql \
php5-cli \
php5 \
inotify-tools -qqy
