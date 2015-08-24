#!/usr/bin/env bash
server=$1

sudo docker rm -f $server
sudo docker run -v /etc/localtime:/etc/localtime:ro -t -i --dns 127.0.0.1 -h $server.localdomain --name $server cstotzer/$server
