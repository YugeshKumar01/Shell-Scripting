#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
    echo "Please provide a number as an argument."
    exit 1
fi


# to provide argument, while running script run like this "<./argument.sh <number> >"

# Using argument to check if the number is even or odd
if (( $1 % 2 == 0 )); then
    echo "The number is even"
else
    echo "The number is odd"
fi

