#!/bin/bash

read -p "Enter your name: " myName
mainDir="submission_reminder_${myName}"
configFile="${mainDir}/config/config.env"

# Check if config file exists
if [ ! -f "$configFile" ]; then
  echo "❌ Can't find config file at: $configFile"
  exit 1
fi

# Prompt for new assignment name
read -p "Enter new assignment name: " new_assignment

# Update the ASSIGNMENT line in config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$configFile"

echo "✅ Assignment updated to \"$new_assignment\" in $configFile"

