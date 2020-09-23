#!/bin/bash

read -p " Enter your ip range " ip_range
echo "your ip range : $ip_range"
mkdir -p results

if prips $ip_range >> results/ips.txt

then 

	echo "good ip range"

else

	echo "bad ip range"

fi


naabu -hL results/ips.txt -o "results/scan_output.txt"

