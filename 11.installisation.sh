#!/bin/bash

User=$(id -u)

if [ $User -ne 0 ] ; then
    echo "ERROR:: please Run the command from root privilages"
    exit 1
fi

dnf install python3 -y

if [ $? -ne 0 ] ; then
    echo "ERROR: Installing python was failed"
    exit 1
else 
    echo "installation was success"
fi