FROM hypriot/rpi-alpine-scratch:edge

RUN apk update && \
	apk upgrade && \
	apk add tar sqlite && \
	rm -rf /var/cache/apk/*

ADD entrypoint.sh /
ADD backup.sh /bin/archiver-backup
ADD restore.sh /bin/archiver-restore

RUN chmod +x /entrypoint.sh && chmod +x /bin/archiver-backup && chmod +x  /bin/archiver-restore

CMD ["/entrypoint.sh"]
