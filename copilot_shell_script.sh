#!/bin/bash


#Get the username to  set up the app's main folder and config file path
echo""
read -p "Enter your name: " myName
mainDir="submission_reminder_${myName}"
configFile="${mainDir}/config/config.env"


# Check if config file exists
if [ ! -f "$configFile" ]; then
  echo "Couldn't locate the config file at: $configFile"
  exit 1
fi


# Prompt the user to enter new assignment name

echo ""
read -p "Enter new assignment name: " new_assign


# modify the Assignment name in config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assign\"/" "$configFile"


#success message to the user
echo""
echo " Assignment successfully updated  to \"$new_assign\" in $configFile"
echo ""
