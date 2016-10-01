FROM resin/rpi-raspbian:jessie
MAINTAINER Thibault Coupin <thibault.coupin@gmail.com>

RUN mkdir -p /mongodb/data && mkdir -p /mongodb/conf
RUN apt-get update && apt-get install mongodb-server


VOLUME /mongodb
EXPOSE 27017 28017
ENV NOHTTPINTERFACE=true
ENV REST=false
ENV MASTER=true
ENV SLAVE=false
ENV SOURCE=master:27017

ADD run.sh /

CMD /run.sh
