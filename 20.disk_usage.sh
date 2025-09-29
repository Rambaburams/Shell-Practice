#!/bin/bash
Disk_Usage=$(df -hT | grep -v Filesystem)
# echo "$Disk_Usage"
DISK_THRESHOLD=1 # in project we keep it as 75
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""

while IFS= read -r line
do
    USAGE=$(echo $line  | awk '{print $6}' | cut -d '%' -f1)
    partitaion=$(echo $line |awk '{print $7}')
    if [ $USAGE -ge $DISK_THRESHOLD ] ; then
        MESSAGE+="High disk usage on $partitaion: $USAGE %"
    fi
done <<< $Disk_Usage

echo -e "Message Body: $MESSAGE"