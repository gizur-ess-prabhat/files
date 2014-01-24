#!/bin/sh

# Create Alias
alias docker='docker -H=tcp://127.0.0.1:4243'

APACHE=$(docker run -d -dns 8.8.8.8 -dns 8.8.4.4 prabhat/apache2 /usr/sbin/apache2 -D FOREGROUND)
MYSQL=$(docker run -d -dns 8.8.8.8 -dns 8.8.4.4 prabhat/mysql /usr/sbin/mysqld)
#REDIS=$(docker run -d -dns 8.8.8.8 -dns 8.8.4.4 prabhat/redis /usr/bin/redis-server)
#NODEJS=$(docker run -d -dns 8.8.8.8 -dns 8.8.4.4 prabhat/nodejs /usr/bin/node /src/index.js)
#HIPACHE=$(docker run -d -dns 8.8.8.8 -dns 8.8.4.4 prabhat/hipache /usr/bin/hipache --config ~/hipache_config.json 2>&1)

echo $APACHE
echo $MYSQL
#echo $REDIS

IP=$(ip -o -4 addr list eth1 | perl -n -e 'if (m{inet\s([\d\.]+)\/\d+\s}xms) { print $1 }')

echo $IP

APACHE_IP=$(docker inspect $APACHE | grep IPAddress | cut -d '"' -f 4)
MYSQL_IP=$(docker inspect $MYSQL | grep IPAddress | cut -d '"' -f 4)
#REDIS_IP=$(docker inspect $REDIS | grep IPAddress | cut -d '"' -f 4)
#NODEJS_IP=$(docker inspect $NODEJS | grep IPAddress | cut -d '"' -f 4)
#HIPACHE_IP=$(docker inspect $HIPACHE | grep IPAddress | cut -d '"' -f 4)

echo "Apache IP  :  $APACHE_IP"
echo "MYSQL IP   :  $MYSQL_IP"
#echo "REDIS IP   :  $REDIS_IP"
#echo "NODEJS IP  :  $NODEJS_IP"
#echo "HIPACHE IP :  $HIPACHE_IP"
