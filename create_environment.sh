#!/bin/bash

#Prompt the user to enter username and create a directory named submission_reminder_<usr_inputed_name>
echo ""
read -p "Please input name: " myName

mainDir="submission_reminder_${myName}"

#create subdirectories in the main directory
mkdir -p "${mainDir}"

mkdir -p "${mainDir}/app" && mkdir -p "${mainDir}/modules" && mkdir -p "${mainDir}/assets" && mkdir -p "${mainDir}/config" 


#create and populate our reminder.sh
cat > "${mainDir}/app/reminder.sh" << 'EOF'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

#create and populate our functions.sh
cat > "${mainDir}/modules/functions.sh" << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

#create and Populate our submssions.txt
cat > "${mainDir}/assets/submissions.txt" << 'EOF'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Robert, Shell Redirections, not submitted
Alex, Python, not submitted
Ladouce, Shell Navigation, not submitted
Annie, Shell Basics, not submitted
Kevine, React Js, submitted
Dior, Git, not submitted
Gerry, Shell Basics, not submitted
EOF

#create and populate our config.env
cat > "${mainDir}/config/config.env" << 'EOF'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

#create and populate our startup.sh
cat > "${mainDir}/startup.sh" << 'EOF'
#!/bin/bash
./app/reminder.sh
EOF

#Allow the execute permission to all .sh files
find "${mainDir}" -type f -name "*.sh" -exec chmod +x {} \;


#Tell the user that the app has been setup successfully into the main directory
echo ""
echo "Awesome! $myName your App is all setup in $mainDir"
echo ""
