#!/bin/bash

# Script				: add-new-user.sh
# Author				: billint
# Date					: 26th Apr 2018
# Objective				: Create new users on system

#######################
##### Bash Script #####
#######################

if [ $UID -ne 0 ]
then
	echo 'Please run with sudo or as root.'
	exit 1
fi

# If they don't supply at least one argument, then give them help.
if [ $# -lt 1 ]
then
	echo "Usage: ${0} USER_NAME [COMMENT]..."
	echo 'Create an account on local system with USER_NAME and comments field of COMMENT.'
	exit 1
fi

# The first parameter is the user name
USER_NAME="${1}"

# Other parameters are account comments
shift
COMMENT="${@}"

# Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

# Create the user with the password.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if useradd command succeeded, don't tell user account created when it wasn't
if [ $? -ne 0 ]; then
	echo 'The account could not be created.'
	exit 1
fi

# Set the password.
echo $PASSWORD | passwd --stdin $USERNAME

# Check to see if the passwd command succeeded
if [ $? -ne 0 ]; then
	echo 'The password for the account could not be set.'
	exit 1
fi

# Force password change on first login
passwd -e $USER_NAME

# Display username, password, and host where user was created
echo
echo 'username:'
echo "$USER_NAME"
echo
echo 'password:'
echo "$PASSWORD"
echo
echo 'host:'
echo "$HOSTNAME"

# Exit status upon successful execution
exit 0

