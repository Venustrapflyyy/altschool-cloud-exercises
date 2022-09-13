## Task 
- create three groups, admin support and engineering and add the admin group to sudoers 
- create a user in each of the groups 
- generate SSH keys for the user in the admin group 

## Instruction 
- submit the contents of /etc/passwd, /etc/group. /etc/sudoers

## Steps 
- I powered on my virtual machine by running the `vagrant up` command then I SSHed in using `vagrant ssh`, all after entering the directory containing my vagrant file 
- I then created the admin, support and engineering groups using the commands `sudo groupadd admin` `sudo groupadd support` and sudo groupadd engineering` respectively 
- I also created a user in each groups using the `useradd admin_user`, `useradd support_user` and `useradd engineering_user` as appropriate, in the respective and appropriate group 
- I also added the user in the admin group to sudoers using the `sudo usermod -aG sudo admin_user` 
- lastly, I generated the SSH keys for the user in the admin group by running the `ssh-keygen` command 

## /etc/passwd
- this was obtained by running the `sudo cat /etc/passwd` command 
![/etc/passwd](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/exercise%20three/cat%20etc%20passwd%20output.png)

## /etc/group
- this was obtained by running the `sudo cat /etc/group` command
![/etc/group](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/exercise%20three/cat%20etc%20group%20output%20.png)

## /etc/sudoers 
- this was obtained by running the `sudo cat /etc/passwd` command
![/etc/sudoers](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/exercise%20three/cat%20etc%20sudoers%20output.png)
