#!/bin/bash

# Script				: add-newer-local-user.sh
# Author				: billint
# Date					: 1st May 2018
# Objective				: Create new user on local system

###########################################################
###### Bash Script / Exercise-03-Creating-Local-Users######
###########################################################

# Script must be executed with superuser privileges
if [[ $UID -ne 0 ]]
then
	echo 'Please run with sudo or as root.' >&2
	exit 1
fi

# If user does not exist supply one argument, provide help
if [ $# -lt 1 ]
then
	echo "USAGE: ${0} USER_NAME [COMENT]..." >&2
	echo 'Create account with the name of USER_NAME and field of COMMENT.'
	exit 1
fi

# The first parameter is the user name
USER_NAME=$1

# Additional parameters are for account comments.
shift
COMMENT="${@}"

# Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c48) 

# Create the user with the password
useradd -c "${COMMENT}" -m ${USER_NAME} &> /dev/null

# Check to see if useradd command succeeded
if [[ "${?}" -ne 0 ]]
then
	echo 'Account could not be created.' >&2
	exit 1
fi

# Set password and verify command succeeded
echo $PASSWORD | passwd --stdin ${USER_NAME} &> /dev/null

if [ $? -ne 0 ]; then
	echo 'The password for the account could not be set.' >&2
	exit 1
fi

# Force password change upon first login
passwd -e ${USER_NAME} &> /dev/null

# Display username, password, host where user was created
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0



