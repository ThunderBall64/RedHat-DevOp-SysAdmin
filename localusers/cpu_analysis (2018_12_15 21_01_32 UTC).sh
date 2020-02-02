#!/bin/bash

# Script				: cpu_analysis.sh
# Author				: billint
# Date					: 25th Jun 2018
# Objective				: calculate cpu usage process by hour

#######################
##### Bash Script #####
#######################

SECS=3600
UNIT_TIME=60

SETPS=$(( $SECS / $UNIT_TIME ))

echo Watching CPU usage... ;

for((i=0;i<STEPS;i++))
do
	ps - eocomm, pcpu | tail -n +2 >> /tmp/cpu_usage.$$
	sleep $UNIT_TIME
done

echo 
echo CPU eaters :

cat 
