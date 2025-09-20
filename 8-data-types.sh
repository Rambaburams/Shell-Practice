#!/bin/bash

NUMBER1=300
NUMBER2=500

SUM=$(($NUMBER1+$NUMBER2))

echo "sum of numbers: $SUM"

LEADERS=("RAMBABU" "RAMESH" "SATISH" "SURESH" "MANI")

echo "All leaders :${LEADERS[@]}" 
echo "first name :${LEADERS[0]}"