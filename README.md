__Submission Reminder App__
This is a simple program that uses basic commands to help students remember when assignments are due.

__What's Inside & What It Does__
Here are the main files and what they do:

create_environment.sh: Sets up everything. This script creates all the folders (config, app, data) and files the app needs.
startup.sh: Starts the app. It shows you who hasn't submitted their work for the current assignment.
app/reminder.sh: This is the main brain of the app. It handles checking the submissions.
app/functions.sh: Has helper tools (like special commands) that the reminder.sh script uses.
copilot_shell_script.sh: Lets you change the assignment name the app checks (like from "Quiz 1" to "Final Project"). It then reruns the reminder for you.
config/config.env: This file holds app settings, like the current assignment name.
data/submissions.txt: This file contains a list of students and their submission status. You'll add more students here!
🚀 How to Use It
Follow these easy steps to get the app running:

Get the App: Clone this project from GitHub to your computer.

Bash

git clone https://github.com/YOUR_GITHUB_USERNAME/submission_reminder_app_YOUR_NAME.git
cd submission_reminder_app_YOUR_NAME
Remember to replace YOUR_GITHUB_USERNAME with your actual GitHub name and YOUR_NAME with your actual name (e.g., submission_reminder_app_Ladouce).
Set Up Everything: Run the setup script. It builds all the necessary folders and files.

Bash

chmod +x create_environment.sh
./create_environment.sh
This script will ask for your name. It uses your name to create the main app folder (e.g., submission_reminder_JohnDoe).
Add More Students: Open data/submissions.txt (it's inside the app folder like submission_reminder_YourName/data/). Add at least 5 more student records following the same simple format you see there.

__Run the Reminder App:__

Bash

cd submission_reminder_YOUR_NAME/ # Go into your app's main folder
./app/startup.sh                 # Start the reminder!
Change Assignment (Optional): If you want to check a different assignment:

Bash

cd ../                           # Go back to the main project folder
./copilot_shell_script.sh        # Run the copilot script
It will ask you for the new assignment name and the full path to your app folder.

__Git Steps (for Submitting Your Work)__
When working on this project, use a feature/setup branch for your coding. When your work is done and tested, merge it into the main branch.

Start your work on a new branch:
Bash

git checkout -b feature/setup
Add your changes and save them (commit):
Bash

git add .
git commit -m "feat: Added the setup script and initial structure"

# Do this step every time you make a good chunk of changes!
When you're ready to submit, merge your work to main:
Bash

git checkout main        # Go to the main branch
git merge feature/setup  # Bring your changes from 'feature/setup' into 'main'
git push origin main     # Send the final 'main' branch to GitHub

__Author__
ISHEJA Ladouce
GitHub Profile https://github.com/ishejaladouce
