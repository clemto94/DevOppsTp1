FROM ubuntu:18.04

RUN apt-get update -y 
RUN apt install curl -y
RUN apt-get install gnupg2 -y
# RUN echo "deb https://apache.bintray.com/couchdb-deb xenial main" \ | tee -a /etc/apt/sources.list.d/apache_couchdb_xenial.list
RUN echo "deb https://apache.bintray.com/couchdb-deb bionic main" \ 
  | tee -a /etc/apt/sources.list
RUN curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc \
  | apt-key add -        
# RUN curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc \ 
#         | apt-key add -


RUN apt-get update && apt-get install couchdb -y 
RUN apt-get install apache2 -y
COPY ./mon_service /etc/init.d
RUN chmod +x /etc/init.d/mon_service

EXPOSE 5984 4369 9100

# RUN apt-get install curl -y
# CMD ["/bin/bash"]
# CMD [ "service", "couchdb", "start" ]
