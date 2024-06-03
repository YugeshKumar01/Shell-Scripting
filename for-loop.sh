#!/bin/bash


#for-loop

# reading a value 
read -p "Enter a number: " number

for ((i=0; i<number; i++)); do
	echo "Hello $((i + 1))"
done

