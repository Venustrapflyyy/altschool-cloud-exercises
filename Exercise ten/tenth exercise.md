## Task 
- We will be deploying a real life application: 
- Demo Project: https://github.com/f1amy/laravel-realworld-example-app
- Setup Debian 11 on a virtual machine instance with a cloud provider or as instructed
- Setup Apache with every dependency the application needs to run
- Don't use Laravel Sail or Docker as suggested in the project README file, simple clone the project with Git and deploy with Apache
- Setup MySQL with credentials and a database for your aplication to use
- Configure a subdomain if you have a domain name to point the VM instance or speak to an instructor for further guide
- You have completed the project if you are able to view the application according to the specifications in the project from your Host browser 

## Process 
- I started by creating  a virtual machine on digital ocean, with the folloing specifications; 1 GB Memory / 25 GB Disk / LON1 - Debian 11 x64 
the public IPv4 for the machine is "161.35.38.124". 

- I then logged into the console as root 

- I updated the apt repository, before I installed any package by running `apt update` 

- I then installed Apache by running `apt install apache2 -y` 

- I installed MySQL by running `apt install mysql-server`, entering my desired password. 

- I then secured it by running `mysql_secure_installation` 

- I installed PHP 8.1 by running `add-apt-repository -y ppa:ondrej/php`, `apt update`, and 
`libapache2-mod-php php php-common php-xml php-mysql php-gd php-opcache php-mbstring php-tokenizer php-json php-bcmath php-zip unzip -y` 

- I configured my PHP by running `nano /etc/php/8.1/apache2/php.ini` to edit the "cgi.fix_pathinfo=0" line, changing 0 to 1. 

- I ran `systemctl restart apache2` to restart apache service 

- I installed composer by running `curl -sS https://getcomposer.org/installer | php`. 
Composer is a PHP dependency manager that manages the dependencies and libraries that PHP applications require. It is required to install Laravel.  

- Then I copied the downloaded binary to the system directory `mv composer.phar /usr/local/bin/composer` 

- Then I ran `composer --version` to see the version of composer I have installed 

- I ran `nano /etc/apache2/sites-available/laravel.conf` to create an Apache virtual host configuration file to host the Laravel application 
```
<VirtualHost *:80>
    ServerAdmin admin@example.com
    ServerName 161.35.38.124
    DocumentRoot /var/www/html/myapp/public

    <Directory /var/www/html/myapp>
    Options Indexes MultiViews
    AllowOverride None
    Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
- I ran `a2enmod rewrite` and `a2ensite laravel.conf` to enable the Apache rewrite module and activate the Laravel virtual host 

- I ran `systemctl restart apache2` to reload the apache service and apply the changes. 

- To install the Laravel app, I ran `mkdir /var/www/html/laravel && cd /var/www/html/laravel` then `git clone https://github.com/laravel/laravel.git` 
to create a folder for the app, go into the folder, and cloning the app repository to my server through git.  

- I ran `composer install --no-dev` to run composer and install the Laravel dependencies. 

- I ran "chown -R :www-data /var/www/html/laravel", `chmod -R 775 /var/www/html/laravel`, `chmod -R 775 /var/www/html/laravel/storage`, 
`chmod -R 775 /var/www/html/laravel/bootstrap/cache`, to give apache permissions over the Laravel directory we made 

- I ran `cp .env.example .env` and `php artisan key:generate` to finish Laravel installation. 

- I ran `mysql -u root -p 'my password'` using the password I initially used when I installed MySQL to log into MySQL, 
and wrote `CREATE DATABASE yourdatabase;` to create a database with the name "yourdatabase". 

- I then ran `nano .env` to configure the ".env" file and made it contain 
```
APP_NAME="Laravel Realworld Example App"
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost
APP_PORT=3000

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=pgsql
DB_HOST=pgsql
DB_PORT=5432
DB_DATABASE=laravel-realworld
DB_USERNAME=sail
DB_PASSWORD=password

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MEMCACHED_HOST=127.0.0.1

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="hello@example.com"
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=
AWS_USE_PATH_STYLE_ENDPOINT=false

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_APP_CLUSTER=mt1

MIX_PUSHER_APP_KEY="${PUSHER_APP_KEY}"
MIX_PUSHER_APP_CLUSTER="${PUSHER_APP_CLUSTER}"

L5_SWAGGER_GENERATE_ALWAYS=true
SAIL_XDEBUG_MODE=develop,debug
SAIL_SKIP_CHECKS=true
```

- I cached my configurations by running `php artisan config:cache` and migrated the database by running `php artisan migrate`. 

- On entering my IP address (161.35.38.124) in my browser, I was shown the Laravel home page. 
![Laravel home page screenshot](https://github.com/Venustrapflyyy/altschool-cloud-exercises/blob/main/Exercise%20ten/laravel%20homepage%20screenshot%20.png)


