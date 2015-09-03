FROM cstotzer/cdh5-base-hadoop

RUN yum install -y postgresql postgresql-server hive hive-server2 zookeeper-server

ADD scripts/ /root/
ADD config/hive-site.xml /usr/lib/hive/conf/

RUN chmod a+rx /root; \
chmod a+rx /root/*.sh; \
chmod a+r /root/*.sql; \
wget -P /usr/lib/hive/lib https://jdbc.postgresql.org/download/postgresql-9.4-1202.jdbc41.jar; \
/root/deploy-zookeeper.sh

USER postgres

RUN /root/deploy-database.sh

USER root

CMD '/root/start-ssh-serf.sh'; '/root/start-hive.sh'; 'bash'