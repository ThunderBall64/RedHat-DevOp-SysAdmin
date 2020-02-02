#!/bin/bash

# Script				: show-attackers.sh
# Author				: billint
# Date					: 30th Apr 2018
# Objective				: Unauthorized access attempts

#######################
##### Bash Script #####
#######################

# Count number of failed logins by IP address

LIMIT='10'

LOF_FILE="${1}"

# Provide a file for argument
if [[ ! -e "${LOG_FILE}" ]] 
then
	echo "Unable to open log file: ${LOG_FILE}" >&2
	exit 1
fi

# Display the CSV header
echo 'Count,IP,Location'

# Loop through list of failed attempts and corresponding IP addresses
grep FAILED ${LOG_FILE} | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr | while read COUNT IP
do
	# If number of failed attempts is greater than limit, display count, IP, 	 and location
	if [[ "${COUNT}" -gt "${LIMIT}" ]]
	then
		LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
		echo "${COUNT},${IP},${LOCATION}"
	fi
done

exit 0

