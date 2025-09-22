#!/bin/bash

echo "Please Enter the Number"
read Number
if [$((Number%2)) -eq 0] ; then 
    echo"the Given $Number is even "
else 
    echo  "the Given $Number is odd"
fi