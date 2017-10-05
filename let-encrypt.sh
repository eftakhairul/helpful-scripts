#!/bin/sh

##################################################################################
# Bash script to install certbot for Ubuntu based systems.
# Written by @eftakhairul from https://eftakahirul.com
#
#
# RUN: bash <(curl -s https://raw.githubusercontent.com/eftakhairul/helpful-scripts/master/let-encrypt.sh)
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

## Adding package
echo -e "$Cyan \n Adding packages for  $Color_Off"
sudo add-apt-repository ppa:certbot/certbot -y


echo -e "$Cyan \n Update package again $Color_Off"
sudo apt-get update


echo -e "$Cyan \n Installing Certbot $Color_Off"
sudo apt-get install python-certbot-nginx

echo -e "$Green \n Example: sudo certbot --nginx -d example.com -d www.example.com  $Color_Off"

