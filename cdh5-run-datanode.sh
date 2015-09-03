#!/bin/bash
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

name=${1-"cdh5-datanode-1"}
namenode=${2-"cdh5-namenode"}
echo "$name $namenode"
./cdh5-run-server.sh ${params} cstotzer/cdh5-datanode $name $namenode
