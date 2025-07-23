#!/bin/bash

source connection_testing_functions.sh
if [ $# -ne 1 ]; then
	echo "Please enter a single argument."
	exit
else
	connection_testing "$1"
fi
