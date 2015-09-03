#!/usr/bin/env bash

env_string=""
interactive=true

while getopts ":p:d" opt; do
	case $opt in
		p)
		  #echo "-p was triggered, Parameter: $OPTARG" >&2
			env_string="${env_string} -p $OPTARG"
			;;
		d)
			env_string="${env_string} -dt"
			interactive=false
			;;
	esac
done

shift "$((OPTIND-1))"

image=$1
name=$2
master=$3

if [ -n "$master" ] ; then
	master_ip=$(sudo docker inspect --format="{{.NetworkSettings.IPAddress}}" $master)
	env_string="${env_string} -e JOIN_IP=${master_ip}"
fi

if [[ interactive = true ]] ; then
	env_string="${env_string} -it"
fi

echo $env_string

sudo docker rm -f $name
sudo docker run -v /etc/localtime:/etc/localtime:ro --dns 127.0.0.1 $env_string -h $name.localdomain --name $name $image
./register-nodes.sh > /dev/null