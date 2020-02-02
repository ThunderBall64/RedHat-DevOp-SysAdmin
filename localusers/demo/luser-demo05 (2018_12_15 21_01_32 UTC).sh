#!/bin/bash

# Script				: luser-demo05.sh
# Author				: billint
# Date					: 25th Apr 2018
# Objective				: Generates list or random passwords

#######################
##### Bash Script #####
#######################

PASSWORD="${RANDOM}"

echo "${PASSWORD}"

# Three random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"

echo "${PASSWORD}"

# Use current date/time as basis for the password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use nano seconds to act as randomization
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# A better password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

# Even better password...
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

# Append special character to the password
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"



