FROM cstotzer/cdh5-base-hadoop

RUN yum install -y bzip2 hadoop-yarn-resourcemanager hadoop-hdfs-namenode hadoop-yarn-nodemanager hadooop-hdfs-datanode hadoop-hdfs-secondarynamenode hadoop-mapreduce-historyserver hadoop-yarn-proxyserver; yum clean all

COPY config/* /root/

RUN mkdir -p /data/hdfs/namenode; \
chown -R hdfs:hdfs /data/hdfs/namenode; \
chmod -R 700 /data/hdfs/namenode; \
su - hdfs -c 'hdfs namenode -format'; \
chmod +x /root/start-namenode.sh

EXPOSE 22 8088 9000

CMD '/root/start-ssh-serf.sh'; '/root/start-namenode.sh'; 'bash'