#!/bin/bash

# Script				: add-local-user.sh
# Author				: billint
# Date					: 23rd Apr 2018
# Objective				: Shell script automate new user accounts

#######################
##### Bash Script #####
#######################

# Superuser privilege execution
if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo privilege.'
	exit 1 # return code
fi

# Account user name
read -p 'Enter the username to create: ' USER_NAME

# Account name assigned too
read -p 'Enter the name of the person this account is for: ' COMMENT

# Get the password for this account
read -p 'Enter the password that will be assigned for this account: ' PASSWORD

# Create user account
useradd -c "${COMMENT}" -m ${USER_NAME}

# Verify script execution to determine if useradd succeeded
if [[ "${?}" -ne 0 ]]
then 
	echo '*** Unable to create new account.'
	exit 1
fi

# Set the password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Forse password change upon first login
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
