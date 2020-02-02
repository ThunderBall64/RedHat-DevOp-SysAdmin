#!/bin/bash

# Script				: luser-demo02.sh
# Author				: billint
# Date					: 22nd Apr 2018
# Objective				: Display UID and username of user executing script

#######################
##### Bash Script #####
#######################

# Display if the user is the root user or not

# Display the UID

echo "Your UID is ${UID}"

# Display username
echo "Your username is ${USER_NAME}"

# Display if user is root or not
if [[ "${UID}" -eq 0 ]]; then
	echo 'This user has root privalage.'
else
	echo 'You do not have root privalage.'
fi

