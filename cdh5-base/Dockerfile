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

RUN sudo ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
sudo ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key && \
sudo ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key

# configure password-less ssh
RUN mkdir /var/run/sshd && \
ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
mv /usr/local/ssh_config ~/.ssh/config

# Enable password-less login from host
ADD ~/.ssh/id_dsa.pub ~/.ssh && cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

CMD 'bash'
