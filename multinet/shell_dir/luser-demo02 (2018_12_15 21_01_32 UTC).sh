#!/bin/bash

# Script				: luser-demo02.sh
# Author				: billint
# Date					: 23rd May 2018
# Objective				: UID, username, and root access

#######################
##### Bash Script #####
#######################

# Display/Echo "${UID}" to the terminal
echo "The UID is ${UID}."

# Display the username
USER_NAME=$(id -un)
echo "Username is ${USER_NAME}."

# Parameter test to determine root access of user executing script
if [[ "${UID}" -eq 0 ]]
then
	echo 'Root Access.'
else
	echo '*** Permission Denied.'
	echo '*** Contact System Administrator.'
fi
 
