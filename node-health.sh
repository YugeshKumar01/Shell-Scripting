#!/bin/bash

#####################
#Author: Yugesh Kumar
#Date: 02/Jun/2024
# This script will tells us node health
#######################################


set -x #debug-mode
set -e # if script find any error it will exit the excution
set -o #pipefail


df -h

free -g

nproc

ps -ef | grep 'amazon' | awk '{print $2}' # this command will give process of amazon running and print only process id
