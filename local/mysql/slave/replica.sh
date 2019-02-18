#!/usr/bin/env bash

echo "MYSQL USER : $MYSQL_USER"
echo "PASSWORD   : $MYSQL_PASSWORD"
echo "ROOT PASSWORD : $MYSQL_ROOT_PASSWORD"
echo ""
echo ""
echo ""
echo ""
echo ""

while ! mysqladmin ping -h local-store --silent; do
  sleep 3
done

#mysql -u root -h mysql -e "RESET MASTER;"
#mysql -u root -h mysql -e "FLUSH TABLES WITH READ LOCK;"

mysqldump -h local-store -u "root" --password="$MYSQL_ROOT_PASSWORD" sample > /tmp/hoge.sql
mysql -u "root" --password="$MYSQL_ROOT_PASSWORD" sample < /tmp/hoge.sql

mysql -u "root" --password="$MYSQL_ROOT_PASSWORD" -e "RESET SLAVE;"
mysql -u "root" --password="$MYSQL_ROOT_PASSWORD" -e "CHANGE MASTER TO MASTER_HOST='local-store', MASTER_USER='$MYSQL_USER', MASTER_PASSWORD='$MYSQL_PASSWORD', master_auto_position=1;"
mysql -u "root" --password="$MYSQL_ROOT_PASSWORD" -e "START SLAVE;"