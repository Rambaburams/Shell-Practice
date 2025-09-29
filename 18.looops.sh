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

validation(){
    if [$1 ne 0];then
        echo -e "Installing $2.....$R Faliure.... $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installing $2.... $G Success... $N" | tee -a $LOG_FILE
}

dnf list installed python3 &>>Log_filename

if [$? ne 0]; then 
dnf install python3 &>>Log_filename
validation $? "python3"
else
    echo -e "python3 alredy exits... $Y Skipping $N"
fi