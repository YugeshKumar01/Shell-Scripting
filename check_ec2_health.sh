#!/bin/bash

<<Setup_gmail

to setup gamil in EC2 instance using ssmtp, configure below 

 sudo apt-get update
sudo apt-get install ssmtp

sudo nano /etc/ssmtp/ssmtp.conf
------------ssmtp.conf file----------------
root=yugeshkumar6202@gmail.com
mailhub=smtp.gmail.com:587
AuthUser=yugeshkumar6202@gmail.com
AuthPass=cxgedyevghntxxdy (generate this password in gmail manage account-->security-->2-step varification-->app passwords)
UseSTARTTLS=YES
TLS_CA_File=/etc/ssl/certs/ca-certificates.crt
-------------------------------------------------

 sudo nano /etc/ssmtp/revaliases
----------revaliases--------------------
root:yugeshkumar6202@gmail.com:smtp.gmail.com:587
---------------------------------------------------

run below command to setup cronjob---

crontab -e

add below line in the file: this cronjob will run in every 5 mins
*/5 * * * * /home/ubuntu/shell-Scripting/check_ec2_health.sh

to check: crontab -l





Setup_gmail



# Get the CPU usage
CPU_USAGE=$(mpstat 1 1 | awk '/Average:/ {print 100 - $NF}')

# Get the memory usage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100}')

# Get the disk usage
DISK_USAGE=$(df -h / | awk '/\// {print $5}' | sed 's/%//')

# Create the email content
EMAIL_SUBJECT="EC2 Instance Health Report for $(date '+%Y-%m-%d')"
EMAIL_BODY="CPU Utilization: ${CPU_USAGE}%
Memory Utilization: ${MEMORY_USAGE}%
Disk Usage: ${DISK_USAGE}%"

# Send the email using ssmtp
echo -e "To: yugeshkumar6202@gmail.com\nSubject: $EMAIL_SUBJECT\n\n$EMAIL_BODY" | ssmtp yugeshkumar6202@gmail.com

