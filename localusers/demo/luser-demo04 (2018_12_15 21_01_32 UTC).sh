#!/bin/bash

# Script				: luser-demo04.sh
# Author				: billint
# Date					: 23rd Apr 2018
# Objective				: Set user name and pass word for accounts

#######################
##### Bash Script #####
#######################

# Ask for user name
read -p 'Enter the username to create: ' USER_NAME

# Ask for real name
read -p 'Enter name of the person who this account is for: ' COMMENT

# Ask for the password
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the user
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password for the user
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force password change on first login
passwd -e ${USER_NAME}

