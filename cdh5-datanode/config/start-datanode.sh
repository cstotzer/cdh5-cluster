#!/bin/bash
echo -n "Starting datanode daemons"
bash -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do service $x start ; done'
service hadoop-yarn-nodemanager start
echo " [ DONE ]"