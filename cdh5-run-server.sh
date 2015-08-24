#!/usr/bin/env bash
server=$1
master_ip=$2
env_string="${master_ip+"\-e JOIN_IP=$master_ip"}"

echo $env_string

sudo docker rm -f $server
sudo docker run -v /etc/localtime:/etc/localtime:ro -t -i --dns 127.0.0.1 $env_string -h $server.localdomain --name $server cstotzer/$server