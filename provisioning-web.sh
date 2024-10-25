#!/bin/bash

#Update e installazione apache e php
apt-get update -y
apt-get upgrade -y
apt-get install -y apache2
systemctl start apache2.service
apt-get install --no-install-recommends -y php8.1
apt-get install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath

#Installazione e confiurazione adminer
mkdir /var/www/html/adminer
wget https://www.adminer.org/latest.php -O /var/www/html/adminer/index.php --no-check-certificate
a2enmod php8.1
chown -R www-data:www-data /var/www/html/adminer
chmod -R 755 /var/www/html/adminer
systemctl restart apache2