#!/bin/bash
# /root/scripts/start-docker.sh

## remove the container if it is there:
docker container stop zabbix-server
docker container rm zabbix-server

## start the container in daemon mode:
docker run -dt --name zabbix-server --volume /backups:/backups -p 80:80 zabbix-image:latest

## start the services:
docker exec zabbix-server service mysql start
docker exec zabbix-server service apache2 start
docker exec zabbix-server service zabbix-server start