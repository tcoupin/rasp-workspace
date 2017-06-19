# owncloud with mysql/sqlite3 connector

FROM easypi/alpine-arm:edge
MAINTAINER Thibault Coupin <thibault@coupin.tk>

ARG OC_VERSION

EXPOSE 80

RUN apk update && \
	apk add apache2 php7-apache2 ffmpeg libreoffice php7-bcmath php7-bz2 php7-calendar php7-ctype php7-curl php7-dba php7-dom php7-exif php7-fileinfo php7-ftp php7-gd php7-gettext php7-gmp php7-iconv php7-imagick php7-intl php7-json php7-mbstring php7-mcrypt php7-openssl php7-pdo_sqlite php7-pdo_mysql php7-phar php7-posix php7-session php7-shmop php7-simplexml php7-soap php7-sockets php7-sqlite3 php7-sysvmsg php7-sysvsem php7-sysvshm php7-tokenizer php7-wddx php7-xml php7-xmlreader php7-xmlwriter php7-zip php7-zlib && \
	rm /var/cache/apk/* && \
	mkdir -p /run/apache2


ADD apache2/ /etc/apache2/
ADD entrypoint.sh /entrypoint.sh

ADD https://download.owncloud.org/community/owncloud-${OC_VERSION}.zip .
ADD https://download.owncloud.org/community/owncloud-${OC_VERSION}.zip.sha256 .

RUN (sha256sum -c owncloud-${OV_VERSION}.zip.sha256 < owncloud-${OC_VERSION}.zip) && \
	unzip owncloud-${OC_VERSION}.zip && \
	rm owncloud-${OC_VERSION}.zip && \
	rm -rf /var/www/localhost && \
	mv owncloud /var/www/html && \
	mkdir /var/www/html/data && \
	chown -R apache:apache /var/www/html && \
	chmod +x /entrypoint.sh

VOLUME /var/www/html/data
VOLUME /var/www/html/apps
VOLUME /var/www/html/config

ENV OC_DBTYPE="sqlite" OC_DBNAME="owncloud" OC_DBUSER="owncloud" OC_DBPASS="owncloud" OC_DBHOST="database" OC_DBTABLEPREFIX="oc_"

CMD /bin/sh /entrypoint.sh
