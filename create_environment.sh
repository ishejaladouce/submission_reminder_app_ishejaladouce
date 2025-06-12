#!/bin/bash

#Prompt the user to enter their name and save their name in myName variable.
read -p "Please input your name: " myName

#create our main directory & subdirectories
mainDir="submission_reminder_${myName}"
mkdir -p "$mainDir"/{app,modules,assets,config}

#create files in the corresponding directories
touch "$mainDir"/app/reminder.sh
touch "$mainDir"/modules/functions.sh
touch "$mainDir"/assets/submissions.txt
touch "$mainDir"/config/config.env
touch "$mainDir"/startup.sh

#Add atleast 5 student records in our submissions.txt
cat <<EOF > "$mainDir/assets/submissions.txt"
Teta,shell basics,submitted
Louange,shell scripting,sumitted
Yakin,Emacs,not submitted
Tunga,Git,submitted
Toussaint,loops & conditions,not submitted
Robert,shell redirections,not submitted
EOF

# Give permission and Make all .sh files executable
find "$mainDir" -type f -name "*.sh" -exec chmod +x {} \;

echo "🎊🎊"
echo "🤩🤩 Awesome! your App is all setup in  $mainDir"
