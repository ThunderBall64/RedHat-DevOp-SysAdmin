#!/bin/bash

# Script				: luser-demo02.sh
# Author				: billint
# Date					: 22nd Apr 2018
# Objective				: Display username and UID

#######################
##### Bash Script #####
#######################

# Display the UID
echo "Your UID is ${UID}"

# Only display UID does NOT match 1000
UID_TO_TEST_FOR='1000'

if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
	echo "Your UID does not match ${UID_TO_TEST_FOR}."
	exit 1
fi


# Display the username
USER_NAME=$(id -un)

# Test if the command succeeded
if [[ "${?}" -ne 0 ]]
then
	echo 'The id command did not execute successfully.'
	exit 1
fi

echo "Your username is ${USER_NAME}"

# String test conditional.
USER_NAME_TO_TEST_FOR='vagrant'

if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then
	echo "Your username matches ${USER_NAME_TO_TEST_FOR}."
fi

# Test for != (not equal) for string.
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then
	echo "Username does not match ${USER_NAME_TO_TEST_FOR}."
	exit 1
fi

exit 0
