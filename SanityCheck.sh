#!/bin/bash

######################################
########    Sanity Check!    #########
####### Dan Duran - GetCyber #########
## Subscribe: Youtube.com/@GetCyber ##
######################################

echo -e "\n ###### SANITY CHECK 0.9 ###### \n"

# Prompt for the base path for the website
read -p "Enter the absolute path for the website: " WEBSITE_PATH

echo -e "\n --> Checking file and folder permissions...\n"
        find $WEBSITE_PATH -printf "%m\t%P\n" | grep -Ev "^(755|644)"
echo -e "\n"
read -p "Press enter to continue"
echo -e "\n Checking file and folder owners... \n"

find $WEBSITE_PATH -printf '%u:%g\t%P\n' | grep -Ev '^(www-data:www-data|\.)'
echo -e "\n"
read -p "Press enter to continue"
echo -e "\n --> Checking possible 'localhost' links... \n"

find $WEBSITE_PATH -type f -exec grep -li 'localhost' {} \; -exec printf 'LOCALHOST %P\n' \; 2>/dev/null

echo -e "\n"
read -p "Press enter to continue"
echo -e "\n --> Checking possible local ips links... \n"

grep -r -Eo '\b(10\.[0-9]{1,3}|172\.(1[6-9]|2[0-9]|3[0-1])|192\.168)\.[0-9]{1,3}\.[0-9]{1,3}\b' $WEBSITE_PATH | awk -F ':' '{pr>

echo -e "\n Sanity check complete... \n"
