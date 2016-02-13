#!/bin/bash

if [ ! -f /tmp/jasper-install.lock ]; then

  # CHECK MYSQL ACCESS
  [ -z "$MYSQL_HOST" ] && echo "MYSQL_HOST REQUIRED" && exit 1
  [ -z "$MYSQL_USERNAME" ] && MYSQL_USERNAME="root"
  [ -z "$MYSQL_PASSWORD" ] && echo "MYSQL_PASSWORD REQUIRED" && exit 1
  [ -z "$MYSQL_PORT" ] && MYSQL_PORT=3306

  sed -i "s/MYSQL_HOST/$MYSQL_HOST/" /tmp/jasperreports-server-cp-6.2.0-bin/buildomatic/default_master.properties
  sed -i "s/MYSQL_USERNAME/$MYSQL_USERNAME/" /tmp/jasperreports-server-cp-6.2.0-bin/buildomatic/default_master.properties
  sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/" /tmp/jasperreports-server-cp-6.2.0-bin/buildomatic/default_master.properties
  sed -i "s/MYSQL_PORT/$MYSQL_PORT/" /tmp/jasperreports-server-cp-6.2.0-bin/buildomatic/default_master.properties

  # RUN INSTALLATION
  cd /tmp/jasperreports-server-cp-6.2.0-bin/buildomatic/
  ./js-install-ce.sh
  
  touch /tmp/jasper-install.lock
fi
