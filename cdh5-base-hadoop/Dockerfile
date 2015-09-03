FROM cstotzer/cdh5-base

# Install software 
RUN yum install -y hadoop-yarn hadoop-hdfs hadoop-client; \
yum clean all	
ADD config/ /tmp/

# hadoop cluster configuration
RUN chmod 1777 tmp; \
source /tmp/prepare-cluster.sh

CMD '/root/start-ssh-serf.sh'; 'bash'
