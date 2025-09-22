#!/bin/bash

User=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $User -ne 0 ] ; then
    echo "Error : please run the script with root privillages"
    exit 1
fi

validation(){
    if [ $1 -ne 0 ] ; then
        echo -e "Installing $2... is $R Failure $N"
        exit 1
    else
        echo -e "Installing $2... is $G success $N"
    fi
}

dnf list installed python
if [$? -ne 0] ; then
    dnf install python -y 
    validation $? "python"
else 
    echo -e "Python alredy exits....$Y Skipping $N"
fi

