#!/bin/bash

# Script	: luser_demo_05.sh
# Name		: Tyler Billings
# Date		: 14 Jan 2018
# Objective	: Generate random data - passwords

#######################
##### Bash Script #####
#######################

# random number password
PASSWORD="${RANDOM}"

echo "${PASSWORD}"

# Three random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use nanoseconds to randomize data
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"


# A better password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
