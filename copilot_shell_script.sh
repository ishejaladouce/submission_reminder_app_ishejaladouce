#!/bin/bash
  
#to get access to our config.env , let's first prompt the user to enter their name
#echo "Please user input your name: "
#read myName

#in order not to always prompt the user for their username cz they might have forgot it.
#let's read the username from .user.tmp (set by create_environment.sh)
if [ ! -f .user.tmp ]; then
        echo "Sorry⚠️  Cannot find .user.tmp - please run create_environment.sh first!"    
        exit 1
fi

myName=$(cat .user.tmp)
setting_file=submission_reminder_$myName/config/config.env

if [ ! -f "$setting_file" ]; then
  echo "Oops😥  config.env file not found"
  exit 1
fi

echo "$myName Please choose a  new assignment name:"
read assign_name

# Update/add the ASSIGNMENT_NAME variable
if grep -q '^ASSIGNMENT_NAME=' "$setting_file"; then
  sed -i "s/^ASSIGNMENT_NAME=.*/ASSIGNMENT_NAME=$assign_name/" "$setting_file"
else
  echo "ASSIGNMENT_NAME=$assign_name" >> "$setting_file"
fi

echo "Hoolay 🤩 Assignment name has been updated!"

