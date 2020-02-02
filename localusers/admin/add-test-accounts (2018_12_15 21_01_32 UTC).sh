#!/bin/bash

# Script				: add-test-accounts.sh
# Author				: billint
# Date					: 6th May 2018
# Objective				: Add test accounts

#######################
##### Bash Script #####
#######################

if [ $UID -ne 0 ]; then
	echo 'Please run with sudo or as root.' >&2
	exit 1
fi

for U in carrief markh harrisonf alecg peterm
do
	useradd $U
	echo 'pass123' | passwd --stdin $U
done

