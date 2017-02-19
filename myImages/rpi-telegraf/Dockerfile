FROM hypriot/rpi-alpine-scratch:edge
MAINTAINER Thibault Coupin <thibault.coupin@gmail.com>


ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.2.1_linux_armhf.tar.gz /tmp/

RUN cd /tmp \
	&& tar -zxvf /tmp/telegraf-1.2.1_linux_armhf.tar.gz \
	&& rm /tmp/telegraf-1.2.1_linux_armhf.tar.gz \
	&& cp -r /tmp/telegraf/* / \
	&& rm -r /tmp/telegraf \
	&& (telegraf config > /etc/telegraf/telegraf.conf)

VOLUME /etc/telegraf

CMD telegraf
