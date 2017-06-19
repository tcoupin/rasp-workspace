#!/bin/sh

if [ ! -f /var/www/config/config.php ] ;then
	if [ $OC_DBTYPE = sqlite ]; then
		cat << EOF > /var/www/config/autoconfig.php
<?php
\$AUTOCONFIG = array(
  "dbtype"        => "$OC_DBTYPE",
  "dbname"        => "$OC_DBNAME",
  "dbtableprefix" => "$OC_DBTABLEPREFIX",
  "directory"     => "/var/www/data",
);
EOF
	elif [ $OC_DBTYPE = mysql ]; then
		cat << EOF > /var/www/config/autoconfig.php
<?php
\$AUTOCONFIG = array(
  "dbtype"        => "$OC_DBTYPE",
  "dbname"        => "$OC_DBNAME",
  "dbuser"        => "$OC_DBUSER",
  "dbpass"        => "$OC_DBPASS",
  "dbhost"        => "$OC_DBHOST",
  "dbtableprefix" => "$OC_DBTABLEPREFIX",
  "directory"     => "/var/www/data",
);
EOF
	else
		echo "UNKNOW DATABASE TYPE $OC_DBTYPE"
		exit 1
	fi
fi

httpd -DFOREGROUND
