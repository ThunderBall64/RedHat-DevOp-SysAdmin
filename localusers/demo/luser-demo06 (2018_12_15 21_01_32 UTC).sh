#!/bin/bash

# Script				: luser-demo06.sh
# Author				: billint
# Date					: 26th Apr 2018
# Objective				: Generates random password for user

#######################
##### Bash Script #####
#######################

# Dislpay what the user typed on the command line
echo "You executed this command: ${0}"

# Display the path and filename of the script.
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script."

NUMBER_OF_PARAMETERS=$#

echo "You supplied $# argument(s) on the command line."

# Supply an argument
if [ $# -lt 1 ]; then
	echo "USAGE: ${0} USER_NAME [USER_NAME]..."
	exit 1
fi

for USER_NAME in $@
do
	PASSWORD=$(date +%s%N | sha256sum | head -c48)
	echo $USER_NAME: $PASSWORD
done

