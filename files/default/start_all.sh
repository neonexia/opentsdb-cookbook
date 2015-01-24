#!/bin/bash

echo "Starting TSDB"
/home/vagrant/start_tsdb.sh
echo
if [ $? -ne 0 ]; then
	echo "**ERROR** something went wrong when starting tsdb, aborting"
	exit $?
fi

echo "Starting TCOLLECTOR"
/home/vagrant/start_tcollector.sh
echo
if [ $? -ne 0 ]; then
	echo "**ERROR** something went wrong when starting tcollector, aborting"
	exit $?
fi
