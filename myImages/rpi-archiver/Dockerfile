FROM hypriot/rpi-alpine-scratch:edge

RUN apk update && \
	apk upgrade && \
	apk add tar && \
	rm -rf /var/cache/apk/*

ADD entrypoint.sh /
ADD save.sh /

RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
