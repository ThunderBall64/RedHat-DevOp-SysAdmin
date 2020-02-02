#!/bin/bash

# Script				: word_freq.sh
# Author				: billint
# Date					: 22nd May 2018
# Objective				: Frequency Analysis

#######################
##### Bash Script #####
#######################

# Testing parameters
if [[ "${#}" -ne 1 ]]
then
	echo "USAGE: $0 filename";
	exit -1
fi

filename="${1}"

egrep -o "\b[[:alpha:]]+\b" $filename | \

awk '{ count[$0]++ }
END{ printf("%-14s%s\n", "Word","Count") ;

for(ind in count)
{ printf("%-14s%d\n",ind,count[ind]); }
}'

