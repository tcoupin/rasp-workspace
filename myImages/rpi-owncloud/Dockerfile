FROM schoeffm/rpi-owncloud
RUN mv /etc/nginx/sites-available/default /tmp/default && (tail -n +6 /tmp/default | sed "s/listen 443 ssl/listen 80/g" > /etc/nginx/sites-available/default)

ENTRYPOINT ["/entrypoint.sh"]
CMD service php5-fpm start && nginx


