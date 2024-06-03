#!/bin/bash

#############################
# Author: Yugesh Kumar
# Date: Jun,02 , 2024
#
# Version: V1
#
# This script will return below resouces of aws
#
# AWS EC2
# AWS S3
# AWS lambda

#############################################


set -x #debug-mode

# to get all ec2 insances
echo "Below is the list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' # jq is for json to get specific data like instance id only

# to get S3 bucket
echo "Below is the S3 bucket"
aws s3 ls

# to get all lambda function
echo "lambda list"
aws lambda list-functions
