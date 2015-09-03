FROM cstotzer/cdh5-base-hadoop

RUN yum clean all; yum install -y hadoop-yarn-nodemanager hadoop-hdfs-datanode hadoop-mapreduce; yum clean all

COPY config/* /root/

RUN mkdir -p /data/hdfs/datanode; \
chown -R hdfs:hdfs /data/hdfs/datanode; \
chmod -R 700 /data/hdfs/datanode; \
chmod +x /root/start-datanode.sh



CMD '/root/start-ssh-serf.sh'; '/root/start-datanode.sh'; 'bash'