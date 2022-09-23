#!/usr/bin/bash

# Usage: A sample shell script to save system memory (RAM) usage at every hour, and forward cummulative hourly memory usage to sys_admin at 00:00 hours

# Author: Zainab Akinlawon

# Declare sys_admin variable
sys_admin="Zainab Akinlawon"
admin_mail="akinlawonjoyz@gmail.com"

# Source and destination files
S='/home/vagrant/RAM_usage.sh'
D='/home/vagrant/logs/memory_info.log'
DIR="/home/vagrant/logs"

# Create a logs directory in "/home/vagrant" but if it exists skip
if [ "$PWD" == "$DIR" ]; 
then  
    echo "Directory Already Exists!"
else
    mkdir -p $DIR
fi

# Switch to the "/home/vagrant/logs" directory
cd /home/vagrant/logs

# To create an empty log file
touch memory_info.log

# Date & Time header
echo "CURRENT DATE/TIME" >> ${D}

# Just a demarcation
echo "------------------------------------" >> ${D}

# Display the curent date and time in UTC format
date >> ${D}

# Insert an empty line
echo "" >> ${D}

# Memory usage header
echo "CURRENT MEMORY USAGE" >> ${D}

# Just another demarcation
echo "-----------------------------------------------------------------------------------------------" >> ${D}

# Display the memory usage statistics
free >> ${D}

# Insert an empty line
echo "" >> ${D}

# Log maintainer header
echo "LOG MAINTAINER" >> ${D}

# Just another demarcation
echo "-------------------------------------------------------" >> ${D}

# This command displays the systems administrator
echo "This log file is being maintained by $sys_admin" >> ${D}

# Insert double empty lines
echo "" >> ${D}; echo "" >> ${D}

echo "                              :bird: NEW LOG ENTRY :bird:             " >> ${D}

echo "" >> ${D}; echo "" >> ${D}

# This clears my terminal before running the command thereby keeping it less messy

clear

# Display contents of the log file 

cat ${D}

# Send a copy of log file to the current users home directory
# currentUsersHome=$HOME  -- For test purposes only
# cp ${D} $HOME  -- For test purposes only

# Send email to sys_admin at 12am
currentTime=$(date +%H:%M)

if [ ${currentTime} = 00:00 ];
    then mail ${admin_mail} < ${D} &&
    # Sleep for 10 seconds and delete the previous log file
    sleep 10 &&
    rm -f ${D}
else
    :
fi
