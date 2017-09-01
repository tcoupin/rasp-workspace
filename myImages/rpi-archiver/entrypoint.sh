#!/bin/sh

if [ ! -d /save ]
then
	echo "Please mount a backup volume at /save"
	exit 1
fi

if [ ! -d /tosave ]
then
	echo "No volume to save into /tosave"
	exit 1
fi


if [[ "$MIN" == "" ]];then MIN='*';fi
if [[ "$HOUR" == "" ]];then HOUR='*';fi
if [[ "$DAY" == "" ]];then DAY='*';fi
if [[ "$MONTH" == "" ]];then MONTH='*';fi
if [[ "$DOW" == "" ]];then DOW='*';fi

echo "$MIN $HOUR $DAY $MONTH $DOW archiver-backup" > /etc/crontabs/root

echo "`date` Init crond $MIN $HOUR $DAY $MONTH $DOW archiver-backup" >> /var/log/archiver.log

crond -b

tail -f /var/log/archiver.log