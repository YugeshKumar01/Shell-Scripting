#!/bin/bash

############################
# Author: Yugesh Kumar
# Date: 02/Jun/2024

# This script will print numbers between 1 to 100 which are divisible by 3 or 5 and not by 15.

######################################################################################

#set -x # Enable debug mode
#set -e # Exit script if any command fails
#set -o pipefail # Ensure the script fails if any command in a pipeline fails

for i in {1..100}; do
    if (( (i % 3 == 0 || i % 5 == 0) && i % 15 != 0 )); then
        echo $i
    fi
done
