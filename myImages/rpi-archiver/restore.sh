#!/bin/sh

if [ ! -d /save ]
then
	echo "Please mount a backup volume at /save"
	exit 1
fi

if [ ! -d /restore ]
then
	echo "Please mount a restore volume at /restore"
	exit 1
fi

if [[ "$1" == "help" || "$1" == "--help" || "$1" == "-help" || "$1" == "--h" || "$1" == "-h" ]]
then
	echo "Usage: restore [VOLUME] [DATE]"
	echo "   - no args:      list volume"
	echo "   - VOLUME:       list dates for this volume"
	echo "   - VOLUME DATE:  restore the volume at this date"
	echo "   - VOLUME last:  restore the last version of the volume"
	exit 1
fi

VOLUME=$1
shift
DATE=$*

if [[ "$VOLUME" == "" ]]
then
	ls /save
	exit 0
fi

if [ ! -d /save/$VOLUME ]
then
	echo "Not a valid volume name"
	echo "List volume with command: archiver-restore"
	exit 1
fi

echo "VOLUME:$VOLUME"

if [[ "$DATE" == "" ]]
then
	ls /save/$VOLUME/_data | sed "s/.tar.gz//g"
	exit 0
fi

if [[ "$DATE" != "last" ]]
then
	if [ ! -f "/save/$VOLUME/_data/$DATE.tar.gz" ]
		then
		echo "Not a valid date for this volume"
		echo "List date with command: archiver-restore $VOLUME"
		exit 1
	fi
	echo "DATE:last"
	MAIN_BCKP=`sqlite3 /save/$VOLUME/backups "select date from backup where main = 1 order by date desc limit 1"`
else
	echo "DATE:$DATE"
	MAIN_BCKP=`sqlite3 /save/$VOLUME/backups "select date from backup where main = 1 and date < \"$DATE\" order by date desc limit 1"`
fi

echo "MAIN_BCKP:$MAIN_BCKP"

cd /restore
rm -rf *

sqlite3 /save/$VOLUME/backups "select date from backup where date >= \"$MAIN_BCKP\" and date <= \"$DATE\" order by date asc" | while read item
do
	tar -zxvf "/save/$VOLUME/_data/$item.tar.gz" --listed-incremental=/dev/null
done