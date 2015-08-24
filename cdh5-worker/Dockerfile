FROM cstotzer/cdh5-base

# move all confugration files into container
ADD files/* /tmp/

RUN mv /tmp/start-ssh-serf.sh ~/start-ssh-serf.sh

RUN chmod +x ~/start-ssh-serf.sh && \
chmod 1777 tmp

EXPOSE 22 7373 7946

CMD '/root/start-ssh-serf.sh'; 'bash'