#!/usr/bin/env bash

while getopts ":p" opt; do
	case $opt in
		p)
		  echo "-p was triggered, Parameter: $OPTARG" >&2
		  ;;
	esac
done

shift "$((OPTIND-1))"
echo $@