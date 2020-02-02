#!/bin/bash

# Script				: mutlinet-demo01.sh
# Author				: billint
# Date					: 14th May 2018
# Objective				: Ping servers and report status

#######################
##### Bash Script #####
#######################

SERVER_FILE='/vagrant/servers'

if [[ ! -e "${SERVER_FILE}" ]]
then
	echo "Cannot open ${SERVER_FILE}." >&2
	exit 1
fi

for SERVER in $(cat ${SERVER_FILE})
do
	echo "Pinging ${SERVER}"
	ping -c 1 ${SERVER} &> /dev/null
	if [[ "${?}" -ne 0 ]]
	then
		echo "${SERVER} down."
	else
		echo "${SERVER} up."
	fi
done


