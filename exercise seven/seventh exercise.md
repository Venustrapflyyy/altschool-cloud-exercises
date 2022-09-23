## Task 
- Create a bash script to run at every hour, saving system memory (RAM) usage to a specified file
- At midnight it sends the content of the file to a specified email address, then starts over for the new day 

## Instruction 
- Submit the content of your script, cronjob and a sample of the email sent, all in the folder for this exercise. 


## Steps 
- I powered on my virtual machine and SSHed into it.
- I then created my bash script titled `RAM_usage.sh` by running `nano memory_email_assignment.sh` and saving the empty script.
- I started my script with a shebang, then declared my
```#!/usr/bin/bash` then declared the `sys_admin=!Zainab Akinlawon", admin_mail="akinlawonjoyz@gmail.com", S="/home/vagrant/RAM_usage.sh", D="/home/vagrant/logs/memory_info.log" and DIR="/home/vagrant/logs"```
variables, with S standing for source and D standing for destination and DIR as a directory. 

I then created an if block 
```if [ "$PWD" == "$DIR" ];
then
    echo "Directory Already Exists!"
else
    mkdir -p $DIR
fi```
to create a "memory_usage.log" file in the "logs" folder if that is not where I am currently located. 
I then wrote `cd /home/vagrant/logs` then touch `memory_info.log` to create $D in $DIR.
I wrote 
```echo "CURRENT DATE/TIME" >> ${D}
echo "------------------------------------" >> ${D}
date >> ${D}
echo "" >> ${D}
echo "CURRENT MEMORY USAGE" >> ${D}
echo "-----------------------------------------------------------------------------------------------">
free >> ${D}
echo "" >> ${D}
echo "LOG MAINTAINER" >> ${D}
echo "-------------------------------------------------------" >> ${D}
echo "This log file is being maintained by $sys_admin" >> ${D}
echo "This log file is being maintained by $sys_admin" >> ${D}
echo "" >> ${D}; echo "" >> ${D}
echo "                              :bird: NEW LOG ENTRY :bird:             " >> ${D}
echo "" >> ${D}; echo "" >> ${D}
clear
cat ${D}```
to forward each line to $D as an appendaged line and at the same time, design the content of ${D}, and to clear my terminal before displaying the output of ${D}.

I declared another variable `currentTime=$(date +%H:%M)`
Then I created another if block 
```if [ ${currentTime} = 00:13 ];
    then mail ${admin_mail} < ${D} &&
    # Sleep for 10 seconds and delete the previous log file
    sleep 10 &&
    rm -f ${D}
else
    :
fi
to command my script to send $sys_admin an email containing ${D} if the time is 00:00(midnight), sleep for 10 seconds, then delete ${D}, else do nothing. 
I then created a cron job 
![crontab content for assignment 7](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/exercise%20seven/crontab%20-e%20for%20meory%20usage%20assignment%20(assignment%207).png?raw=true)
to automate my bash script every hour. 

Lastly, I changed the timezone on my virtual machine to that of my host machine by running the `$ sudo timedatectl set-timezone Europe/London` command
