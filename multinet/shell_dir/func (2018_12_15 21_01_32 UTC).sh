#!/bin/bash

# Script				: func.sh
# Author				: billint
# Date					: 22nd May 2018
# Objective				: Example of a function and global var

#######################
##### Bash Script #####
#######################

# Assign var as global
GLOBAL="accessing variables"

foo ()
{
	local inside="unable to access variables"
	echo $GLOBAL
	echo $inside
	GLOBAL="variables are no accessible."
}

echo $GLOBAL
foo
echo $GLOBAL
echo $inside
