#!/bin/bash


<<comment

Author: Yugesh Kumar
Date: June,03,24

This script is for practice if-elf-else statement.

comment


# Read value
read -p "Enter a number: " num	


# use -lt(less then), -le (less then equal), -gt, -ge and eq(equal) for comparision for number value. >,< this operator is use for string.
if (( $num < 10 )); then			# (()) while using this we can use >,<,=,== operator 	
	echo "number is single digit"
elif [[ $num -ge 10 && $num -lt 100 ]]; then	# [[]] while using this we should use -lt, -le, -ge ..etc
	echo "number is double digit"
else
	echo "number is not a single and double digit"
fi
