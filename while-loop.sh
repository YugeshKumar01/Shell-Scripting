#!/bin/bash

# Best Practices Example for a while loop

# Function to print a prompt and read user input
get_input() {
    read -p "Enter a number (or type 'exit' to quit): " input
}

# Initial input
get_input

# Loop until the user enters 'exit'
while [[ "$input" != "exit" ]]; do
    # Check if input is a number
    if [[ "$input" =~ ^[0-9]+$ ]]; then
        echo "You entered a number: $input"
    else
        echo "Invalid input. Please enter a number or 'exit'."
    fi
    
    # Get the next input
    get_input
done

echo "Goodbye!"

