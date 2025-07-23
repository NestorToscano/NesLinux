#!/bin/bash

output="$(ping -c 3 $1)"
#echo "$output"

if [[ "$output" == *"100% packet loss"* ]]; then
	echo "$1 is currently not working"
else
	echo "$1 is recieving packets!"
fi
