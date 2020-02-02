#!/bin/bash

# Script	: random_pw_generator.sh
# Name		: Tyler Billings	
# Date		: 14 Jan 2019
# Objective	: Generate random pw for user on cmd

#######################
##### Bash Script #####
#######################

echo "User executed command: ${0}"

echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script."

NUMBER_OF_PARAMETERS="${#}"
echo "You supplied ${NUMBER_OF_PARAMETERS} arguments(s) on the command line."

# supply an argument
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
	echo "Usage: ${0} USER_NAME [USER_NAME]..."
	exit 1
fi
