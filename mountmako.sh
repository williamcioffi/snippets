#!/bin/sh

if [ -z "$1" ]
then
	echo "usage: mountmako [netid]"
	exit 1
fi

sudo mount -t cifs //mako.ml.duke.edu/users/ -o username=$1,uid=1000,vers=2.0 /home/foci/mako/
