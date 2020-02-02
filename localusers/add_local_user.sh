#!/bin/bash

# Script	: add_local_user.sh
# Name		: Tyler Billings	
# Date		: 13 Jan 2018
# Objective	: Add local users RHEL

#######################
##### Bash Script #####
#######################

# Only execute script with root privileges
if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or root privilege.'
	exit 1
fi

# Get the username (login)
read -p 'Enter the username to create: ' USER_NAME

# Get real name (contents for the description field)
read -p 'Enter name of person or application: ' COMMENT

# Get password
read -p 'Enter password to use for account: ' PASSWORD

# Create account
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if useradd command succeeded
# if not - tell user
if [[ "${?}" -ne 0 ]]
then
	echo 'The account could not be created'
	exit 1
fi

# Set password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
	echo 'The password for account could not be set..'
	exit 1
fi

# Force password change at first login
passwd -e ${USER_NAME}

# display username, password, and host where user was created
echo 
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host'
echo "${HOSTNAME}"
exit 0
