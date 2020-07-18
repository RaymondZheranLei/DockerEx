FROM danielwnn/mariadb_oqgraph_ubuntu_v1:latest
RUN /bin/bash -c 'apt-get update && apt-get -y install redis-server'
RUN /bin/bash -c 'add-apt-repository ppa:openjdk-r/ppa && apt-get update && apt-get install openjdk-8-jdk'
RUN /bin/bash -c 'apt-get install wget'
RUN /bin/bash -c 'cd ~/ && wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb && dpkg -i elasticsearch-1.7.2.deb'
COPY --chown=777 start_service.sh /
EXPOSE 3306/tcp
EXPOSE 6379/tcp
EXPOSE 9200/tcp
ENTRYPOINT ["/bin/bash", "-c", "/start_service.sh"]