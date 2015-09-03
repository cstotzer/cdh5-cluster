#!/usr/bin/env bash
params="-ti"
while getopts ":d" opt; do
	case $opt in
		d)
		  #echo "-p was triggered, Parameter: $OPTARG" >&2
		  params="-d "
		  ;;
	esac
done

shift "$((OPTIND-1))"

name=${1-"cdh5-namenode"}
image=cstotzer/cdh5-namenode

./cdh5-run-server.sh ${params} -p 127.0.0.1:2022:22 -p 127.0.0.1:8088:8088 -p 127.0.0.1:9000:9000 $image $name