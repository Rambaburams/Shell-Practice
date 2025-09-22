#!/bin/bash

User=$(id -u)

if [ $User -ne 0 ] ; then
    echo "ERROR:: please Run the command from root privilages"
fi

dnf install python3 -y

if [ $? -ne 0 ] ; then
    echo "ERROR: Installing python was failed"
else 
    echo "installation was success"