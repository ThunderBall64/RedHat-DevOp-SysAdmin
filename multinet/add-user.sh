#!/bin/bash

# Script				: add-user.sh
# Author				: billint
# Date					: 23rd May 2018
# Objective				: Create new user account

#######################
##### Bash Script #####
#######################

# Test parameter settings for executing script as root
if [[ "${UID}" -ne 0 ]]
then
	echo 'Execute script as root or sudo.'
	exit 1
fi

# Set up a username (login)
read -p 'Assign username to account. Enter username: ' USER_NAME

# Full name account assigned too
read -p 'Account owner. Enter full name: ' COMMENT

# Assign password to this account
read -p 'Assign password. Enter password: ' PASSWORD

# Create user account
useradd -c "${COMMENT}" -m ${USER_NAME}

# Verify useradd command succeeded
if [[ "${?}" -ne 0 ]]
then
	echo '*** Unable to create new user acount.'
	exit 1
fi

# Set the password for this account
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Verify passwd command succeeded
if [[ "${?}" -ne 0 ]]
then
	echo '*** Unable to set new password for this account.'
	exit 1
fi

# Force password upon initial login
passwd -e ${USER_NAME}

# Display username, password, and host where user was created
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0
