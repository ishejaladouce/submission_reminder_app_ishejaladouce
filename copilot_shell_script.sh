#!/bin/bash
setting_file="submission_reminder_$myName/config/config.env"
if [ -f "$setting_file"]; then
	sed -i 's/^ASSIGNMENT_NAME=.*/ASSIGNMENT_NAME=Updated_submission_Reminder/' "$setting_file"
	echo "Hoolay 🤩 ASSIGNMENT_NAME has been updated!"
else
	echo "Oops config.env file not found"

fi
