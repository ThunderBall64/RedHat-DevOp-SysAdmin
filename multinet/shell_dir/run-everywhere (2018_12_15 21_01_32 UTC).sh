#!/bin/bash

# Script				: run-everywhere.sh
# Author				: billint
# Date					: 20th May 2018
# Objective				: List of servers, one per line

#######################
##### Bash Script #####
#######################

SERVER_LIST='/vagrant/servers'

# Options for the ssh command.
SSH_OPTIONS='-o ConnectTimeout=2'

usage() {
	# Display the usage and exit
	echo "Usage: ${0} [-nsv] [-f FILE] COMMAND" >&2
	echo 'Executes COMMAND as a single command on every server.' >&2
	echo "-f FILE Use for the list of servers. Default ${SERVER_LIST}." >&2
	echo '-n Dry run mode. Display cmd executed and explain.' >&2
	echo '-s Execute cmd sudo on remote server.' >&2
	echo '-v Verbose mode. Displays server name before exec CMD.' >&2
	exit 1
}

# Make sure script doesn't begin execution with superuser privileges.
if [[ "${UID}" -eq 0 ]]
then
	echo 'Do not execute this script as root. Use -s CMD.' >&2
	usage
fi

# Parse the options
while getopts f:nsv OPTION
do
	case ${OPTION} in
		f) SERVER_LIST="${OPTARG}" ;;
		n) DRY_RUN='true' ;;
		e) SUDO='sudo' ;;
		v) VERBOSE='true' ;;
		?) usage ;;
	esac
done

# Remove the options while leaving the remaining arguments.
shift "$(( OPTIND - 1 ))"

# If the user doesn't supply at least one argument, give them help
if [[ "${#}" -lt 1 ]]
then
	usage
fi

# Anything that remains on the command line is to be treated as single command
COMMAND="${@}"

# Make sure the SERVER_LIST file exists.
if [[ ! -e "${SERVER_LIST}" ]]
then
	echo "Cannot open server list file ${SERVER_LIST}." >&2
	exit 1
fi

# Expect the best, prepare for the worst
EXIT_STATUS='0'

# Loop through the SERVER_LIST
for SERVER in $(cat ${SERVER_LIST})
do
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${SERVER}"
	fi

	SSH_COMMAND="ssh ${SSH_OPTIONS} ${SERVER} ${SUDO} ${COMMAND}"

	# If dry run, don't execute anything, just echo it.
	if [[ "${DRY_RUN}" = 'true' ]]
	then
		echo "DRY RUN: ${SSH_COMMAND}"
	else
		${SSH_COMMAND}
		SSH_EXIT_STATUS="${?}"

		# Capture any non-zero exit status from SSH report to user
		if [[ "${SSH_EXIT_STATUS}" -ne 0 ]]
		then
			EXIT_STATUS=${SSH_EXIT_STATUS}
			echo "Execution on ${SERVER} failed." >&2
		fi
	fi
done

exit ${EXIT_STATUS}



