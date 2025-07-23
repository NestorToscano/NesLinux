#!/bin/bash

ips=($(cat ip_list.txt))

i=0
while [[ $i -lt ${#ips[@]} ]]
do
	((i++))
done

echo "There are a total of $((i)) ips in the file"
