## Owncloud on alpine for RaspberryPi

This image is available on hub : https://hub.docker.com/r/tcoupin/rpi-owncloud.

Sqlite and mysql are supported.

**Volumes:**

- User data: /var/www/html/data
- Extra apps: /var/www/html/apps
- Configuration: /var/www/html/config

**Port:** only 80. You can add https in apache configuration or by adding [traefik](https://traefik.io) reverse proxy who supports Let's Encrypt (see [here](../../myStack/main/) and [here](../../conf/traefik)).

**Environment variables:**:

- *OC_DBTYPE*: sqlite or mysql (default value: "sqlite")
- *OC_DBNAME*: sqlite filename or mysql database (default value: "owncloud")
- *OC_DBUSER*: user for mysql connection (default value: "owncloud")
- *OC_DBPASS*: password for mysql connection (default value: "owncloud")
- *OC_DBHOST*: host for mysql connection (default value: "database")
- *OC_DBTABLEPREFIX*: table prefix (default value: "oc_")
