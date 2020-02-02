#!/bin/bash

# Script				: disable-local-user.sh
# Author				: billint
# Date					: 23rd Apr 2018
# Objective				: Disable account for local-user

#######################
##### Bash Script #####
#######################

ARCHIVE_DIR='/archive'

# Using a function
usage() {
	# Display usage and exit
	echo "Usage: ${0} [-dra] USER [USERN]..." >&2
	echo 'Disable a local Linux account.' >&2
	echo '	-d Deletes accounts instead of disabling them.' >&2
	echo '	-r Removes the home directory associated with the account(s).' >&2
	echo ' 	-a Creates an archive of home directory associated with account.' >&2
	exit 1
}

if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or as root.' >&2
	exit 1
fi

# Parse the options
while getopts dra OPTION
do
	case ${OPTION} in
		d) DELETE_USER='true' ;;
		r) REMOVE_OPTION='r' ;;
		a) ARCHIVE='true' ;;
		?) usage ;;
	esac
done

# Remove options while leaving remaining arguments
shift "$(( OPTIND - 1 ))"

# If user doesn't supply at least one argument, give them help.
if [[ "${#}" -lt 1 ]]
then
	usage
fi

# Loop through all usernames supplied as agruments
for USERNAME in "${@}"
do
	echo "Processing user: ${USERNAME}"
	
	# Make sureUID of account is at least 1000.
	USERID=$(id -u ${USERNAME})
	if [[ "${USERID}" -lt 1000 ]]
	then
		echo "Refusing to remove the ${USERNAME} account with UID ${USERID}." >&2
		exit 1
	fi

	# Create archive if required
	if [[ "${ARCHIVE}" = 'true' ]] 
	then
		if [[ ! -d "${ARCHIVE_DIR}" ]] 
		then
			echo "Creating $ARCHIVE_DIR directory."
			mkdir -p $ARCHIVE_DIR
			if [ $? -ne 0 ]; then
				echo "The archive directory $ARCHIVE_DIR could not be created." >&2
				exit 1
			fi
		fi
		# Archive user's home directory and move it into the ARCHIVE_DIR
		HOME_DIR="/home/${USERNAME}"
		ARCHIVE_FILE="${ARCHIVE_DIR}/${USERNAME}.tgz"
		if [[ -d "${HOME_DIR}" ]]
		then
			echo "Archiving ${HOME_DIR} to ${ARCHIVE_FILE}"
			tar -zcf ${ARCHIVE_FILE} ${HOME_DIR} &> /dev/null
			if [[ "${?}" -ne 0 ]]
			then
				echo "Could not create ${ARCHIVE_FILE}." >&2
				exit 1
			fi
		else
			echo "${HOME_DIR} does not exist or is not a directory." >&2
			exit 1
		fi
	fi

	if [[ "${DELETE_USER}" = 'true' ]] 
	then
		# Delete the user
		userdel ${REMOVE_OPTION} ${USERNAME}

		# Verify userdel cmd execution succeeded
		if [ $? -ne 0 ]; then
			echo "The account $USERNAME was NOT deleted." >&2
			exit 1
		fi
		echo "The account $USERNAME was deleted."
	else
		chage -E 0 $USERNAME

		if [ $? -ne 0 ]; then
			echo "The account $USERNAME was NOT disabled." >&2
			exit 1
		fi
		echo "The account $USERNAME was disabled."
	fi

done

exit 0 
















