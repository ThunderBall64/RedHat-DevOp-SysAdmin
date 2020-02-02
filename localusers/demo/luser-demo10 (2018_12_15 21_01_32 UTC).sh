#!/bin/bash

# Script				: luser-demo10.sh
# Author				: billint
# Date					: 2nd May 2018
# Objective				: Defining a function

#######################
##### Bash Script #####
#######################

log() {
	# This function sends message to syslog and standard output if Verbose is true
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi

	logger -t luser-demo10.sh "${MESSAGE}"
}

backup_file() {
	# This function creates backup file and returns non-zero status on error
	local FILE="${1}"
	
	# Check to see if file exists
	if [[ -f "${FILE}" ]]
	then
		local BACKUP_FILE="/var/tmp$(basename ${FILE}).$(date +%F-%N)"
		log "Backing up ${FILE} to ${BACKUP_FILE}."

		# The exit status function will be exit status of cp command
		cp -p ${FILE} ${BACKUP_FILE}
	else
		# The does not exist, return non-zero exit status.
		return 1
	fi
}

readonly VERBOSE='true'

log 'Executeing...'
log 'Shell script!'

backup_file /etc/passwd

# Make decision based on eit status of function
if [[ "${?}" -eq '0' ]]
then
	log 'File backup succeeded!'
else
	log 'File backup failed!'
	exit 1
fi


