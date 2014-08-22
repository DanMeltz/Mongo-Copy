#!/bin/sh

# This script takes a Mongo dump (I never fail to giggle at that) from one Mongo DB instance
# then it copies the dump file to a different Mongo DB instance
#
# Written by
# Dan Meltz <djm2(at)piratedan.com>

# Empty the variables, just in case.
ORIGIN_IP=""
DESTINATION_IP=""
CURRENT_TIME=""
DUMP_DIR_NAME=""

# Set some defaults, since it will usually be used with these
# This was originally used 90% of the time for the same two servers, so 
# 
ORIGIN_IP=127.0.0.1
DESTINATION_IP=127.0.0.1
CURRENT_TIME=`date -u +"%Y-%m-%d-%H.%M.%S"`
DUMP_DIR_NAME="mongo-dump-$CURRENT_TIME"

while getopts ":o:d:f:" name
do
    case $name in
    o)  ORIGIN_IP=$OPTARG;;
    d)  DESTINATION_IP=$OPTARG;;
    f)  DUMP_DIR_NAME=$OPTARG;;
    \?)  printf "Usage: %s: [-o source_IP_address] [-d destination_IP_address] [-f filename] \n" $0
        exit 2;;
    esac
done

# I originally had a bunch of error checking here, but took it out, since a bad IP address will fail 
# anyway, so why bother?

# First take a Mongo dump from the origin DB:
mongodump --host $ORIGIN_IP:27017 -vvv -o $DUMP_DIR_NAME
# Next, copy it to the destination DB:
mongorestore --drop --host $DESTINATION_IP --port 27017 $DUMP_DIR_NAME
echo "It's mongotime!"
