FROM centos
MAINTAINER cstotzer <cstotzer@diso.ch>

ENV SERF_CONFIG_DIR /etc/serf

RUN yum upgrade -y; \
yum clean all; \
yum install -y openssh-server openssh-clients sudo vim wget unzip dnsmasq bind-utils java-1.8.0-openjdk net-tools lsof nmap; \
yum clean all

# Add the CDH4 repository
# Adding cloudera repos
RUN wget http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/cloudera-cdh5.repo; \
mv cloudera-cdh5.repo /etc/yum.repos.d/cloudera-cdh5.repo;\
rpm --import http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera

# install serf
RUN curl -Lso serf.zip https://dl.bintray.com/mitchellh/serf/0.5.0_linux_amd64.zip; \
unzip serf.zip -d /bin; \
rm serf.zip

ADD dnsmasq/* /etc/
ADD serf/* $SERF_CONFIG_DIR/
ADD handlers $SERF_CONFIG_DIR/handlers
ADD config/ /tmp/

# configure serf
RUN chmod +x  $SERF_CONFIG_DIR/event-router.sh $SERF_CONFIG_DIR/start-serf-agent.sh

# configure ssh
RUN ssh-keygen -A; \
mkdir /var/run/sshd; \
ssh-keygen -t rsa -f ~/.ssh/id_rsa -P ''; \
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys; \
mv /tmp/ssh_config ~/.ssh/config; \
chmod 600 /root/.ssh/* 

# run general daemons
RUN mv /tmp/start-ssh-serf.sh ~/start-ssh-serf.sh; \
chmod +x ~/start-ssh-serf.sh;

# create root password
RUN echo 'root:root' | chpasswd

CMD '/root/start-ssh-serf.sh'; 'bash'