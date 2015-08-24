
docker rmi -f $(docker images -aq | grep -v 7322fbe74aa5)
sudo docker build -t 'cstotzer/cdh5-base:latest' cdh5-base
sudo docker build -t 'cstotzer/cdh5-master:latest' cdh5-master
sudo docker build -t 'cstotzer/cdh5-worker:latest' cdh5-worker
