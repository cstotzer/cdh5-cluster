#!/usr/bin/env bash
server=$1
master=$2
env_string=""
if [ -n "$master" ] ; then
	echo "toto $master"
	master_ip=$(sudo docker inspect --format="{{.NetworkSettings.IPAddress}}" $master)
	echo $master_ip
	#env_string="-e JOIN_IP=${master_ip} --link ${master}:${master}"
	env_string="-e JOIN_IP=${master_ip}"
	echo $env_string
fi

echo $env_string

sudo docker rm -f $server
sudo docker run -P -v /etc/localtime:/etc/localtime:ro -t -i --dns 127.0.0.1 $env_string -h $server.localdomain --name $server cstotzer/$server