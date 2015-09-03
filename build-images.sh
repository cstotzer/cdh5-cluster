
# sudo docker rmi -f $(sudo docker images -aq | grep -v 7322fbe74aa5)
sudo docker build -t 'cstotzer/cdh5-base:latest' cdh5-base
sudo docker build -t 'cstotzer/cdh5-namenode:latest' cdh5-namenode
sudo docker build -t 'cstotzer/cdh5-datanode:latest' cdh5-datanode
