#/usr/bin/env bash
/usr/bin/cp -r /etc/hadoop/conf.empty /etc/hadoop/conf.cdh5
alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.cdh5 50
alternatives --set hadoop-conf /etc/hadoop/conf.cdh5
alternatives --display hadoop-conf
cp /tmp/hadoop/* /etc/hadoop/conf.cdh5
mkdir -p /data/hdfs; \
chown -R hdfs:hdfs /data/hdfs; \
chmod -R 700 /data/hdfs; \
mkdir -p /data/yarn/local
mkdir -p /data/yarn/logs
mkdir -p /data/yarn/intermediate-done-dir
mkdir -p /data/yarn/done-dir
chown yarn:yarn /data/yarn/local 
chown yarn:yarn /data/yarn/logs
chown yarn:yarn /data/yarn/intermediate-done-dir
chown yarn:yarn /data/yarn/done-dir
chmod 1777 /data/yarn/intermediate-done-dir
chmod 1777 /data/yarn/done-dir