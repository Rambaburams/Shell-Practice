#!/bin/bash

User= $(id)

if [ $User -ne 0 ] ; then
    echo "ERROR:: please Run the command from root privilages"
fi