#!/bin/bash


#Reading a value

read -p "Enter a number: " num

#conditional check
if (( $num%2 == 0 )); then
	echo "number is even"
else
	echo "number is odd"

fi
