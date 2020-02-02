#!/bin/bash

# Script				: luser-demo07.sh
# Author				: billint
# Date					: 26th Apr 2018
# Objective				: Use of shift and while loops

echo "Parameter 1: $1"
echo "Parameter 2: $2"
echo "Parameter 3: $3"

echo 

while [ $# -gt 0 ] 
do
	echo "Number of parameters: $#"
	echo "Parameter 1: $1"
	echo "Parameter 2: $2"
	echo "Parameter 3: $3"
	echo
	shift
done


