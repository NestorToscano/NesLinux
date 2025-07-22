#!/bin/bash
# make sure to add execution permission 700 / +x
# or source / bash the file without setting permissions

# Loading env file
source .env

read -p "What var from the .env file would you like? " first_var
read -p "Whats another var from the .env file would you like? " second_var

#  -n "${!first_var}" : indirect expansion check if has a value (checks ref var)
# -n "$first_var" : is just checking for input
#  -v "$first_var" : check if variable exists at all (checks name)

if [ -v "$first_var" ]
then 
	echo "$first_var is ${!first_var}"
else
	echo "$first_var does not exist"
fi

if [ -v "$second_var" ]
then
	echo "$second_var is ${!second_var}"
else 
	echo "$second_var does not exist"
fi
