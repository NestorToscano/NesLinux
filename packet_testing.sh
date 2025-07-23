#!/bin/bash
#DROPPED_IP="8.8.8.8 1.1.1.1 10.10.10.1"

#for ip in $DROPPED_IP
#for ip in $(cat ip_list.txt)

ips=($(cat ip_list.txt)) # array of ips
# ((...)) : arithmetic operations needed for c style loop
for ((i=0; i<${#ips[@]}; i++)) # #ips[@] : count of all elements
do
	echo "Packets are being dropped from ${ips[i]}" # ${...} : syntax
	sleep 1s
	iptables -I INPUT -s "${ips[i]}" -j DROP
done

sleep 5s

#for ip in $DROPPED_IP; do

for ip in ${ips[@]}
do
	echo "Packets are now being restored: $ip"
	sleep 1s
	iptables -D INPUT -s $ip -j DROP
done
