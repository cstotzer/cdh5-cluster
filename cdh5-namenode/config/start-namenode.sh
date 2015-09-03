#!/bin/bash
echo -n "Starting namenode daemons"
bash -c 'for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do service $x start ; done'

if [ ! -f "/root/namenode-ready" ] ; then
	sudo -u hdfs hadoop fs -mkdir /dataexpo
	sudo -u hdfs hadoop fs -mkdir /tmp
    sudo -u hdfs hadoop fs -chmod -R 1777 /tmp
    sudo -u hdfs hadoop fs -mkdir -p /user/history
    sudo -u hdfs hadoop fs -chmod -R 1777 /user/history
    sudo -u hdfs hadoop fs -chown mapred:hadoop /user/history
    sudo -u hdfs hadoop fs -mkdir -p /var/log/hadoop-yarn
    sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-yarn

    touch /root/namenode-ready
fi

service hadoop-yarn-resourcemanager start
service hadoop-yarn-nodemanager start
service hadoop-mapreduce-historyserver start

echo " [  DONE  ] "