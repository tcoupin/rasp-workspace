FROM hypriot/rpi-alpine-scratch:edge

RUN apk update && \
	apk upgrade && \
	rm -rf /var/cache/apk/*

RUN echo "*/15 * * * * wget -O /var/log/owncloud-cron.log http://owncloud-cron/owncloud/cron.php" > /etc/crontabs/root

ENTRYPOINT /bin/sh
CMD "crond -f"