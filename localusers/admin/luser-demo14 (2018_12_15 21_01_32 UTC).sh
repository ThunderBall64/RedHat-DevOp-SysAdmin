#!/bin/bash

# Script				: luser-demo14.sh
# Author				: billint
# Date					: 10th May 2018
# Objective				: Display top 3 visited URL's 
# ...					: in web server log file

#######################
##### Bash Script #####
#######################

LOG_FILE=$1

if [ ! -e $LOG_FILE ]; then
	echo "Cannot open $LOG_FILE" >&2
	exit 1
fi

cut -d '"' -f 2 $LOG_FILE | cut -d ' ' -f 2 | sort | uniq -c | sort -n | tail -3
