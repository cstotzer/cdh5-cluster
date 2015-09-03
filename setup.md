#setup.md

yum clean all; yum install -y hadoop-yarn-resourcemanager hadoop-hdfs-namenode hadoop-hdfs-secondarynamenode; yum clean all
yum clean all; yum install -y hadoop-0.20-mapreduce-tasktracker hadoop-hdfs-datanode; yum clean all

cdh5-namenode

- HDFS NameNode
- HDFS Secondary NameNode
- YARN Resource Manager

cdh5-datanode

- HDFS DataNode
- MapReduce Task Tracker

cp -r /etc/hadoop/conf.empty /etc/hadoop/conf.cdh5

[root@master ~]# alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.cdh5 50
[root@master ~]# alternatives --set hadoop-conf /etc/hadoop/conf.cdh5
[root@master ~]# alternatives --display hadoop-conf

/etc/hadoop/conf.cdh5/core-site.xml
  <property>
    <name>fs.defaultFS</name>
    <value>hdfs://cdh5-namenode.localdomain:8020</value>
  </property>

/etc/hadoop/conf.cdh5/hdfs-site.xml
  <property>
    <name>dfs.permissions.superusergroup</name>
    <value>hadoop</value>
  </property>

/hadoop/conf.cdh5

hdfs namenode -format