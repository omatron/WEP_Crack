#!/bin/bash


INTERFACE=$(ip a | grep w | cut -d ":" -f 2 | cut -d " " -f 2)

#echo $INTERFACE

#SUB=7;COUNT=$(airmon-ng | wc -l ) ;RES= $(echo "$COUNT-$SUB" | bc)

    for i in {0..5} 
        do
        airmon-ng stop mon$i  > /dev/null
        done


airmon-ng start $INTERFACE


read -p "Press Enter to start Scan and Ctrl+C when finished. "

 
airodump-ng mon0


read -p "Insert target BSSID " BSSID
 
read -p "Insert target Channel " CHANNEL

echo $BSSID
echo $CHANNEL

airodump-ng -w log -c $CHANNEL --bssid $BSSID mon0


