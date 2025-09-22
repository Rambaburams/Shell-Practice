#!/bin/bash

User=$(id -u)

if [ $User -ne 0 ] ; then
    echo "Error : please run the script with root privillages"
    exit 1
fi

validation(){
    if [ $1 -ne 0 ] ; then
        echo "Error: Installation of $2 was falied"
    else
        echo "Insatllation of $ was success"
    fi
}

dnf install python -y
validation $? "Python"
