#!/usr/bin/env bash
mkdir -p /var/lib/zookeeper
chown -R zookeeper /var/lib/zookeeper/
service zookeeper-server init
service zookeeper-server start
