#!/bin/bash

# Script				: luser-demo13.sh
# Author				: billint
# Date					: 10th May 2018
# Objective				: Open network ports tcp4

#######################
##### Bash Script #####
#######################


netstat -nutl ${1} | grep : | awk '{print $4}' | awk -F':' '{print $NF}'

