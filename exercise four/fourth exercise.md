## Task 
- Install PHP 7.4 on your local linux machine using the ppa:ondrej/php package repo 

## Instruction 
- Learn how to use the add-apt-repository command
- Submit the content of /etc/apt/sources.list and the output of php -v command 

## Steps
- I opened up my terminal and powered on my virtual machine then SSHed into it 
- on my virtual machine, I started by running `sudo apt-get update` to update `apt-get` itself 
- I then installed `software-properties-common`, which adds management for additional software sources 
- I installed the repository `ppa:ondrej/php`, which will gave me all versions of PHP, then updated `apt-get again` so my package manager can see the newly listed packages 
- I ran `sudo apt -y install php7.4` to install php 7.4 

## php-v 
- the output of `php -v` 
- !(php -v)[]
