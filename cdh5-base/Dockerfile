FROM centos
MAINTAINER cstotzer <cstotzer@diso.ch>

# Add the CDH4 repository
ADD cloudera-cdh5.repo /etc/yum.repos.d/

# Upgrade the images packages
RUN yum clean all && yum upgrade -y

# Install software 
RUN yum clean all && yum install -y openssh-server vim hadoop-yarn hadoop-hdfs java-1.8.0-openjdk unzip curl dnsmasq bind-utils && yum clean all	

# dnsmasq configuration
ADD dnsmasq/* /etc/

# install serf
RUN curl -Lso serf.zip https://dl.bintray.com/mitchellh/serf/0.5.0_linux_amd64.zip && \
unzip serf.zip -d /bin && \
rm serf.zip

# configure serf
ENV SERF_CONFIG_DIR /etc/serf
ADD serf/* $SERF_CONFIG_DIR/
ADD handlers $SERF_CONFIG_DIR/handlers
RUN chmod +x  $SERF_CONFIG_DIR/event-router.sh $SERF_CONFIG_DIR/start-serf-agent.sh

ADD config/* /usr/local/ 

RUN ssh-keygen -A

# configure password-less ssh
RUN mkdir /var/run/sshd && \
ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
mv /usr/local/ssh_config ~/.ssh/config

# create root password
RUN echo 'root:root' | chpasswd

CMD 'bash'