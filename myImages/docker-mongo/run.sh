#!/bin/bash

if [[ "$SLAVE" == "true" ]]
then
  MASTER="false"
fi

cat > /mongodb/mongodb.conf << EOF
dbpath=/mongodb/data


# Enable journaling, http://www.mongodb.org/display/DOCS/Journaling
journal=true

# Disable the HTTP interface (Defaults to localhost:28017).
nohttpinterface = $NOHTTPINTERFACE
rest = $REST

master = $MASTER
slave = $SLAVE
source = $SOURCE

EOF



/usr/bin/mongod -f /mongodb/mongodb.conf
