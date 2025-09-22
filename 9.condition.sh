#!/bin/bash

NUMBER1=$1

if [ $NUMBER1 -ne 0 ] ; then 
    echo "Given Number $NUMBER1 is less than 10"
else
    echo "Given Number $NUMBER1 is greater than or equal to 10"
fi