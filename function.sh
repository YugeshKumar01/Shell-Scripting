#!/bin/bash

# Function for addition
add() {
    local num1=$1
    local num2=$2
    echo "Sum of $num1 and $num2 is: $(( num1 + num2 ))"
}

# Function for subtraction
sub() {
    local num1=$1
    local num2=$2
    echo "Difference of $num1 and $num2 is: $(( num1 - num2 ))"
}

# Function for multiplication
multiply() {
    local num1=$1
    local num2=$2
    echo "Multiply of $num1 and $num2 is: $(( num1 * num2 ))"
}

# Function for division
div() {
    local num1=$1
    local num2=$2
    if (( num2 != 0 )); then

    		echo "Division of $num1 and $num2 is: $(( num1 / num2 ))"
	else
		echo "Division of 0 is not possible"
    fi
}

# Reading numbers from the user
read -p "Enter 1st number: " num1
read -p "Enter 2nd number: " num2

# Calling the functions
add $num1 $num2
sub $num1 $num2
multiply $num1 $num2
div $num1 $num2
