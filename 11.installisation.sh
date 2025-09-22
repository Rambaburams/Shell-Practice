#!/bin/bash

User= $(id -u)

if [ $User -ne 0 ] ; then
    echo "ERROR:: please Run the command from root privilages"
fi