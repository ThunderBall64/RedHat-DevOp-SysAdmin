#!/bin/bash

# Script				: luser-demo08.sh
# Author				: billint
# Date					: 27th Apr 2018
# Objective				: Initiate I/O Redirection

#######################
##### Bash Script #####
#######################

FILE="/tmp/data"

head -n1 /etc/passwd > $FILE

read LINE < $FILE
echo "LiNE contains: ${LINE}"

head -n3 /etc/passwd > $FILE

echo 

echo "Contents of $FILE:"
cat $FILE

# Redirecto STDOUT to a file, appending the file
echo "$RANDOM $RANDOM" >> $FILE
echo "$RANDOM $RANDOM" >> $FILE
echo

echo "Contents of ${FILE}:" 
cat $FILE

# Redirect STDERR to a file using FD 2
ERR_FILE="/tmp/data.err"
head -n3 /etc/passwd /fakefile 2> ${ERR_FILE}
echo
echo "Contents of ${ERR_FILE}:"
cat ${FILE}

# Redirect STDOUT and STDERR through a pipe
echo 
head -n3 /etc/passwd /fakefile |& cat -n

# Send output to STDERR
echo "This is STDERR!" >&2

echo 
echo "Discarding STDOUT:"
head -n3 /etc/passwd /fakefile > /dev/null

echo
echo "Discarding STDOUT and STDERR:"
head -n3 /etc/passwd /fakefile &> /dev/null

# Clean up
rm ${FILE} ${ERR_FILE} &> /dev/null

