#!/bin/bash
mkdir -p /config/nginx/site-confs /config/www
if [ ! -f "/config/nginx/nginx.conf" ]; then
cp /root/config-files/nginx.conf /config/nginx/nginx.conf
fi

if [ ! -f "/config/nginx/nginx-fpm.conf" ] ; then
cp /root/config-files/nginx-fpm.conf /config/nginx/nginx-fpm.conf
fi
/bin/cp -f /config/nginx/nginx-fpm.conf /etc/php5/fpm/pool.d/www.conf
chown -R abc:abc /config
