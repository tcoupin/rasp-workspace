#!/bin/sh

echo "`date` ### Start backuping"  >> /var/log/archiver.log

for vol in `ls /tosave`
do
	echo "`date` # Process $vol" >> /var/log/archiver.log
	DATE=`date +"%Y-%m-%d %H:%M:%S.000"`
	MAIN=0
	if [ ! -d /save/$vol ]
	then
		mkdir -p /save/$vol/_data
	fi

	sqlite3 /save/$vol/backups "create table if not exists backup (date date, main boolean)"

	if [ ! -f /save/$vol/save.list ]
	then
		MAIN=1
	fi

	sqlite3 /save/$vol/backups "insert into backup values (\"$DATE\", $MAIN)"

	cd /tosave/$vol
	tar -zcf "/save/$vol/_data/$DATE.tar.gz" --listed-incremental=/save/$vol/save.list *

	echo "`date` # Finish $vol" >> /var/log/archiver.log
done

echo "`date` ### Finish backup" >> /var/log/archiver.log
