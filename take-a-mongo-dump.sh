#!/bin/sh

# Get today's date
CURRENT_TIME=`date -u +"%Y-%m-%d-%H.%M.%S"`

# This is the IP address of the Mongo DB you're taking a dump from
DB_IP=127.0.0.1

# Dump data from the EMKI CMS and save it in the current directory, in a
# sub-directory that has today's date as part of the name.
# NOTE the IP address is hard-coded for the Dev environment in AWS
mongodump --host $DB_IP:27017 -vvv -o emki-mongodb-dump-$CURRENT_TIME