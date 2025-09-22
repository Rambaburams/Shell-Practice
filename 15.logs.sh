#!/bin/bash

User=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Logs_floder="/var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1)
Log_filename="$Logs_floder/$script_name.log"

mkdir -p $Logs_floder
echo "script started at :$(date)"

if [ $User -ne 0 ] ; then
    echo "Error : please run the script with root privillages"
    exit 1
fi
