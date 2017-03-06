#!/bin/sh

echo "`date` ### Start backuping"  >> /var/log/archiver.log

for vol in `ls /tosave`
do
	echo "`date` # Process $vol" >> /var/log/archiver.log
	if [ ! -d /save/$vol ]
	then
		mkdir -p /save/$vol/_data
	fi
	tar -zcf /save/$vol/_data/$vol_`date +%Y-%m-%d_%H-%M`.tar.gz --listed-incremental=/save/$vol/save.list /tosave/$vol
	echo "`date` # Finish $vol" >> /var/log/archiver.log
done

echo "`date` ### Finish backup" >> /var/log/archiver.log
