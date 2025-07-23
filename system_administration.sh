#!/bin/bash

PS3="Enter your choice: "

select ITEM in "Add User" "List All Processes" "Kill Process" "Install Program" "Quit"
do
if [[ $REPLY -eq 1 ]]
then
	read -p "Enter the username: " username
	output="$(grep -w $username /etc/passwd)"
	if [[ -n "$output" ]]
	then
		echo "$username : Already exists"
	else
		sudo useradd -m -d /bin/bash "$username"
		if [[ $? -eq 0 ]] # Checking last run command status
		then
			echo "$username : Added successfully"
			tail -n 1 /etc/passwd
		else
			echo "$username : Error adding this username"
		fi
	fi
elif [[ $REPLY -eq 2 ]]
then
	echo "Listing all processess: "
	sleep 1
	ps aux
elif [[ $REPLY -eq 3 ]]
then
	read -p "Enter process to kill: " process
	pkill $process
elif [[ $REPLY -eq 4 ]]
then
	read -p "Enter program to install: " app
	sudo apt update && sudo apt install $app
elif [[ $REPLY -eq 5 ]]
then
	echo "Now Quiting."
	sleep 1
	exit
else
	echo "Invalid selection"
fi
done
