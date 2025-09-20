#!/bin/bash

Date=$(date)
echo "$Date"

Start_time = $(date +%s)
end_time=$(date +%s)
total_time=$(($Start_time+$end_time))
echo "total_time is : $total_time"