#!/bin/bash

#Prompt the user to enter their name and create  a directory named submission_reminder_<User-inputed-name>
read -p "Please input your name: " myName
mainDir="submission_reminder_${myName}"

#create subdirectories in the main directory (submission_reminder_${myName})
mkdir -p "mainDir/app"
mkdir -p "mainDir/modules"
mkdir -p "mainDir/assets"
mkdir -p "mainDir/config"

#create and populate our config.env
cat <<EOF > "mainDir/config/config.env"
#App configuration
ASSIGNMENT=Assignment 1
EOF

#create and populate our reminder.sh
cat <<EOF > "$mainDir/app/reminder.sh"
#!/bin/bash
source ../config/config.env
source ../modules/functions.sh
echo "Just checking on who's missing submissions\$ASSIGNMENT..."
get_submission_status ../assets/submissions.txt \$ASSIGNMENT
EOF

# Create and populate our functions.sh
cat <<EOF > "$mainDir/modules/functions.sh"
#!/bin/bash
get_submission_status() {
    file="\$1"
    assignment="\$2"
    echo ""
    echo "Who still needs to submit for \$assignment:"
    grep ",\$assignment,missing" "\$file" | cut -d',' -f1
}
EOF

# Create and populate our submissions.txt with at least 5 students
cat <<EOF > "$mainDir/assets/submissions.txt"
Teta,Assignment 1,submitted
Louange,Assignment 1,missing
Yakin,Assignment 1,missing
Tunga,Assignment 1,submitted
Toussaint,Assignment 1,missing
Robert,Assignment 1,missing
EOF

# Create and populate our startup.sh
cat <<EOF > "$mainDir/assets/startup.sh"
#!/bin/bash
bash ../app/reminder.sh
EOF

# Give permission and Make all .sh files executable
find "$mainDir" -type f -name "*.sh" -exec chmod +x {} \;

echo "🎊🎊"
echo "🤩🤩 Awesome! your App is all setup in  $mainDir"
