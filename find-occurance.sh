#!/bin/bash


#set -x # debugmode
#set -e
#set -o

x="densspasisi"


# Using grep to count occurrences of 's'
count=$(echo -n "$x" | grep -o 's' | wc -l)

echo "The number of occurrences of 's' in the string is: $count"
