#!/bin/bash

# Script				: ping-host.sh
# Author				: billint
# Date					: 25th Jun 2018
# Objective				: Ping host network

#######################
##### Bash Script #####
#######################

# prompt user to enter argument
if [ -z "$1" ] || [ "$1" = -h ] || [ "$1" = '--help' ]
then
	echo 'USAGE: ping-host HOST [HOSTN]...' >&2
	echo 'Returns 0 if host repongs, 1 if no response.' >&2
	exit 
fi

OS=$(uname -s)

