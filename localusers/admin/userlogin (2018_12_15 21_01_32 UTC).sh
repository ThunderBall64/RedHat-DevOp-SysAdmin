#!/bin/bash

# Script				: userlogin.sh
# Author				: billint
# Date					: 22nd Apr 2018
# Objective				: Prompt user for login

#######################
##### Bash Script #####
#######################

# Request user to enter user name upon executing script
echo -n "Enter user name: "

read name

# Test for existence of user. If user does not exist, access is denied.
# Grant access if user exists and echo confirmation
if [ "$name" = "$USER" ]; then
	echo "User $name confirmed. Access granted."
else
	echo "*** User $name invalid. Access denied."
fi

