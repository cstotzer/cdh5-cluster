#!/bin/bash

# start sshd
echo "start sshd..."
/usr/sbin/sshd -D 

# start sef
echo -e "\nstart serf..." 
/etc/serf/start-serf-agent.sh > serf_log &

sleep 5

serf members