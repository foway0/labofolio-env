#!/usr/bin/env bash

echo "MYSQL USER : $MYSQL_USER"
echo "PASSWORD   : $MYSQL_ROOT_PASSWORD"
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""

mysql -u "root" --password="$MYSQL_ROOT_PASSWORD" -e "GRANT REPLICATION SLAVE ON *.* TO '$MYSQL_USER'@'%'"