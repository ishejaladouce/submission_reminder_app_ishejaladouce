__STUDENT SUBMISSION REMINDER APP__

This is a simple application built with Linux shell scripts. Its purpose is to quickly identify which students have not yet submitted their assignments, and to automate pre-deadline checks.

__what it does__

- Guided Setup: It will prompt you for your name to help set up the app's environment quickly.
- Student Tracking: Allows you to add and manage student records, including their name, assignment, and submission status.
- Smart Reminders: The app reads assignment details from a configuration file and then clearly displays which students are missing submissions for the specified assignment.
- Dynamic Updates: A "Copilot" script is included, providing a simple way to update the assignment name being checked at any time.


__Project Structure__

submission_reminder_<yourName>/
│
├── app/
│ └── reminder.sh # Runs the main logic and reminder
│
├── modules/
│ └── functions.sh # Function to check who has not submitted
│
├── assets/
│ └── submissions.txt # List of students & their submission status
│
├── config/
│ └── config.env # Assignment name and days remaining
│
├── startup.sh # Launches the reminder script
└── copilot_shell_script.sh # Updates assignment in config file

__How to use__

1. Run the setup script that creates everything
	./create_environment.sh

2. Move to your new folder
	cd submission_reminder_<yourName>

3. Run the app to see: the assignment name, how many days remain, and who has not submitted the assignment.
	./startup.sh

4. Change/modify the Assignment name
	./copilot_shell_script.sh

__How it's built

- Bash: Written entirely in Bash shell script.
- Liux: Relies on how Linux organizes files and handles permissions.
Git: We used Git to manage all the code and keep track of updates
