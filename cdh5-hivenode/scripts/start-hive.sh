#!/usr/bin/env bash
function outcome {
	if [ $1 == "0" ] ; then
  		echo "  [  SUCCESS  ]"
	else 
		echo "  [  FAILURE  ]"
	fi
}

DATADIR=/var/lib/pgsql/data/

echo -n "Starting database"
sudo -u postgres postgres -D $DATADIR >/dev/null &
outcome $?

echo -n "Starting zookeeper" 
service zookeeper-server start > /dev/null 
outcome $?

echo -n "Starting hive-server" 
service hive-server2 start > /dev/null 
outcome $?

