#!/bin/bash

# Script				: luser-demo12.sh
# Author				: billint
# Date					: 6th May 2018
# Objective				: This script deletes a user

#######################
##### Bash Script #####
#######################

# Run as root
if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or as root.' >&2
	exit 1
fi

# Assume first argument is the user to delete.
USER="${1}"

# Delete the user
userdel ${USER}

# Verify user was deleted
if [ $? -ne 0 ]; then
	echo "The account $USER was NOT deleted." >&2
	exit 1
fi

# Advise user account was deleted
echo "The account $USER has been deleted from database."

exit 0

