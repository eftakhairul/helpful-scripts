#!/bin/sh

##################################################################################
# Bash script to install an LEMP stack plus tweaks. For Ubuntu based systems.
# Written by @eftakhairul from https://eftakahirul.com
#
#
# RUN: bash <(curl -s https://raw.githubusercontent.com/eftakhairul/helpful-scripts/master/lemp-server.sh)
###################################################################################

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

# Update packages and Upgrade system
echo -e "$Cyan \n Updating System.. $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y

# Installing essentials packages
echo -e "$Cyan \n Installing Essentials Packages $Color_Off"
sudo apt-get -y install python-software-properties
sudo apt-get -y install software-properties-common

## Install LEMP
echo -e "$Cyan \n Installing Nginx $Color_Off"
sudo apt-get install nginx -y

echo -e "$Cyan \n Installing PHP & Requirements $Color_Off"
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update && sudo apt-get -y install php7.1-fpm php7.1-mysql php7.1-curl php7.1-gd php7.1-mcrypt php7.1-sqlite3 php7.1-bz2 php7.1-mbstrin php7.1-soap php7.1-xml php7.1-zip

echo -e "$Cyan \n Installing Composer $Color_Off"
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

echo -e "$Cyan \n Installing MySQL $Color_Off"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password 123456'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 123456'
sudo apt-get -y install mysql-server

## TWEAKS and Settings
# Permissions
echo -e "$Cyan \n Permissions for /var/www $Color_Off"
sudo chown -R www-data:www-data /var/www
echo -e "$Green \n Permissions have been set $Color_Off"

# Restart Nginx
echo -e "$Cyan \n Restarting Nginx $Color_Off"
sudo /etc/init.d/nginx restart
