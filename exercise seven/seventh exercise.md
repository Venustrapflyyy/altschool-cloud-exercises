## Task 
- Create a bash script to run at every hour, saving system memory (RAM) usage to a specified file
- At midnight it sends the content of the file to a specified email address, then starts over for the new day 

## Instruction 
- Submit the content of your script, cronjob and a sample of the email sent, all in the folder for this exercise. 


## Steps 
- I powered on my virtual machine and SSHed into it 
- I then created my bash script titled `memory_email_assignment.sh` by running `nano memory_email_assignment.sh` and saving the script 
- I then ran the command `echo $(free)` in my bash script, to first visualise my memory information 
- Afterwards, I ran `echo $(free > /vagrant/ramusage)` in my bash script
- This is to save the memory information to the vagrant folder in my host machine, in a file called  "memory_info"
- I also included `cd /home/vagrant` as a line in my bash script to show the pathway and location for my cron job (according to the AltschoolLMS Tutor's lessons) 
- I then created a cron job by running `* * * * * bash /home/vagrant/memory_email_assignment.sh`
- This automates my bash script (which saves the output of `echo $(free > /vagrant/ramusage` to my host machine) and makes it run every minute 
