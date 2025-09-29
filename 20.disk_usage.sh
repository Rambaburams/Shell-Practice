#!/bin/bash
Disk_Usage=$(df -hT | grep -v Filesystem)
echo "$Disk_Usage"

while IFS= read -r line
do
    USAGE=$(echo $line  | awk '{print $6}')
done <<< Disk_Usage