FROM resin/rpi-raspbian:jessie
MAINTAINER Thibault Coupin <thibault.coupin@gmail.com>

RUN mkdir -p /mongodb/data && mkdir -p /mongodb/conf
RUN apt-get update && apt-get install mongodb-server


VOLUME /mongodb
EXPOSE 27017 28017 27019
ENV NOHTTPINTERFACE=true
ENV REST=false
ENV MASTER=true
ENV SLAVE=false
ENV SOURCE=master:27017
ENV CONFIGSRV=false
ENV SHARDSRV=false
ENV CONFIGDB=configsrv:27019

ADD run.sh /

CMD /run.sh
