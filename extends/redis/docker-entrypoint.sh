#!/bin/sh

cluster_conf_file=redis-cluster.conf

rm -rf /redis-data/*

for port in 7000 7001 7002 7003 7004 7005;
do
  conf_path=/redis-conf/${port}
  data_path=/redis-data/${port}

  mkdir -p ${conf_path}
  mkdir -p ${data_path}

  PORT=${port} envsubst < /data/${cluster_conf_file} > ${conf_path}/${cluster_conf_file}

  redis-server ${conf_path}/${cluster_conf_file} --port ${port} --cluster-config-file ${data_path}/nodes.conf --daemonize yes ;
done;

IP_ADDRESS=`ip --oneline --family inet address show dev eth0 | cut -d' ' -f7 | cut -d'/' -f1`
echo "yes" | redis-cli --cluster create ${IP_ADDRESS}:7000 ${IP_ADDRESS}:7001 ${IP_ADDRESS}:7002 ${IP_ADDRESS}:7003 ${IP_ADDRESS}:7004 ${IP_ADDRESS}:7005 --cluster-replicas 1;

## TODO monitoring
tail -f