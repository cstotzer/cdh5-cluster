#!/usr/bin/env bash
function outcome {
	if [ $1 == "0" ] ; then
  		echo "  [  SUCCESS  ]"
	else 
		echo "  [  FAILURE  ]"
	fi
}

SCRIPTDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DATADIR=/var/lib/pgsql/data/

echo -n "Initialising database..."
initdb -D $DATADIR &>/dev/null 
outcome $?

echo -n "Starting database"
postgres -D $DATADIR &>/dev/null &
outcome $?

hive_version=$(hive --version | sed -n 's/^Hive \([[:digit:]]\+.[[:digit:]]\+.[[:digit:]]\).*$/\1/p')

createdb metastore

psql -d metastore -c "CREATE USER hiveuser WITH PASSWORD 'hiveuser00';"
cd /usr/lib/hive/scripts/metastore/upgrade/postgres
psql -d metastore -f hive-schema-${hive_version}.postgres.sql
cd $SCRIPTDIR
psql -d metastore -f grant.sql

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
echo "host all  all    0.0.0.0/0  md5" >> $DATADIR/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``
echo "listen_addresses='*'" >> $DATADIR/postgresql.conf
