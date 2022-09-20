## Task 
- Create a bash script to run at every hour, saving system memory (RAM) usage to a specified file
- At midnight it sends the content of the file to a specified email address, then starts over for the new day 

## Instruction 
- Submit the content of your script, cronjob and a sample of the email sent, all in the folder for this exercise. 


## Steps 
- I powered on my virtual machine and SSHed into it 
- I then created my bash script titled `ramsavebashassignment.sh` by running `nano ramsavebashassignment.sh` and saving the script 
- I then ran the command `echo $(sudo cat /proc/meminfo)` in my bash script, to first visualise my memory usage information 
- Afterwards, I ran `echo $(sudo cat /proc/meminfo > /vagrant/ramusage)` in my bash script
- This is to save the RAM usage information to the vagrant folder in my host machine, in a file called  "ramusage"
- I also included `cd /home/vagrant` as a line in my bash script to show the pathway and location for my cron job 
- I then created a cron job by running `* * * * * bash /home/vagrant/ramsavebashassignment.sh`
- This automates saving the output of my `sudo cat /proc/meminfo` to my host machine and makes it a minutely activity 
