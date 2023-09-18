## Task
- Create an Ansible Playbook to setup a server with Apache

- The server should be set to the Africa/Lagos Timezone

- Host an index.php file with the following content, as the main file on the server; <?phpdate("F d, Y h:i:s A e", time());?>


## Instruction
- Submit the Ansible playbook, the output of systemctl status apache2 after deploying the playbook and a screenshot of the rendered page


## Steps 
- I firstly created a multimachine vagrant file and editted the file on vscode to contain 
```
Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo Hello"

  config.vm.define "local" do |loc|
    loc.vm.box = "ubuntu/focal64"
    loc.vm.hostname = "local"
    loc.vm.network "private_network", ip: "192.168.50.4"
  end

  config.vm.define "remote" do |rem|
    rem.vm.box = "ubuntu/focal64"
    rem.vm.hostname = "remote"
    rem.vm.network "private_network", ip: "192.168.50.5"
  end
end
```

- I then ran `vagrant up` on my terminal and that turned on two different vagrant machines, one named local and the other one named remote 

- Then I sshed into both of them on different terminals by running `vagrant ssh local` and `vagrant ssh remote`, the local machine was my master machine and the remote one is my slave machine.

- I tried to first ssh into my remote machine from my local machine by running `ssh remote@192.168.50.5` which gave me a public key error 
![This is an image](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/exercise%20eight/Screenshot%202022-09-29%20000753.png?raw=true)

- To correct this, I ran `sudo nano /etc/ssh/sshd_config` and changed `# PubkeyAuthentication yes` to `PubkeyAuthentication yes` (removed the # to uncomment it), I also changed `PasswordAuthentication no` to `PasswordAuthentication yes`, on both local and remote machines. 

- Then I restarted the machine by running `sudo systemctl restart sshd.service` and ran the `ssh remote@192.168.50.5` command again, which worked this time. 

- In my local machine, I created a folder called ansible in my `/home/vagrant` directory. 

- In the ansible directory, I created an inventory file (inventory.yml) and made it contain the ip address of my remote machine (192.168.50.5) and saved this file. 

- I then tried to ping my remote machine by running `ansible all -i inventory.yml -m ping` which returned another public key; permission denied error 
![This is an image](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/exercise%20eight/Screenshot%202022-09-29%20000753.png?raw=true)

- To correct this, I  editted the inventory.yml file and made it contain 
```
192.168.50.5
[all:vars]
ansible_connection=ssh
ansible_user=vagrant
ansible_ssh_pass=vagrant
```

- Then I restarted the machine again and ran the `ansible all -i inventory.yml -m ping`, which worked this time. 
![This is an image](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/exercise%20eight/ping%20success.png)

- Also in my ansible directory, I created another file called playbook.yml which contained 
```
   GNU nano 4.8                                                                                       playbook.yml
---
- name: deploy apache2 on host server[remote]
  hosts: all
  become: true # Perform all the Ansible playbook tasks as another user.
  become_user: root # Default username to be used by Ansible

  tasks:
    - name: Update all packages to their latest version
      ansible.builtin.apt:
        name: "*"
        state: latest
        update_cache: yes

    - name: Install Apache server/PHP/Apache-PHP-module
      ansible.builtin.apt:
        name:
        - apache2
        - php
        - libapache2-mod-php
        state: latest

    - name: "Remove useless packages from the cache & dependencies that are no longer required"
      ansible.builtin.apt:
        autoclean: yes
        autoremove: yes

    - name: Start/restart service apache2, if not started
      ansible.builtin.systemd:
        name: apache2
        enabled: yes
        state: restarted

    - name: set timezone to Africa/Lagos
      timezone:
        name: Africa/Lagos

    - name: Copy my "index.php" file to the host server[remote]
      ansible.builtin.copy:
        src: /home/vagrant/ansible/index.php
        dest: /var/www/html/index.php
        remote_src: no
```
then saved the file. 

- The purpose of this playbook is to deploy apache2 on remote server, update all packages to their latest version, install Apache server/PHP/Apache-PHP-module, remove useless packages from the cache & dependencies that are no longer required, start/restart service apache2 if not started, set timezone to Africa/Lagos, and copy my "index.php" file to the remote server, all on the slave machine, from the master machine.  

- Again, in my ansible directory, I created another file called `index.php` which contains 
```
<?php
echo (date("d-m-y h:i:s"));
?>
```

- The function of this php file is to display the date and time when ip_address/index.php is entered into a browser. 

- Lastly, I ran `ansible-playbook playbook.yml -i inventory.yml` to run my playbook. 

- When I entered my IP address into a browser, I got this 
![This is an image](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/exercise%20eight/ip%20address%20rendered%20page.png)

- When I entered my IP address/index.php in a browser, I got this 
![This is an image](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/exercise%20eight/ip%20adress%20and%20index.php%20rendered%20page.png)
