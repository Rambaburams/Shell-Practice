#!/bin/bash

User=(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir=$1
dest_dir=$2
days=${3::-14} #if days is not provided it will consider default  as 14 days

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
#LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
LOG_FILE="$LOGS_FOLDER/backup.log" # modified to run the script as command

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $User -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

usage(){
    echo -e "$R usage:: source_dir deation_dir days $N"
}

if [ $# -lt 2 ] ; then 
    usage
fi

# check source dir
if [ ! -d -$source_dir ] ; then 
    echo -e "$R source $source_dir does not exits $N"
    exit 1
fi

#check dist dir 

if [ ! -d $dest_dir ] ; then 
    echo -e "R dest_dir $dest_dir does not exits $N"
    exit 1
fi

Files=$(find $source_dir -name "*.log" -type -f mtime +$days)

if [ ! -z "${FILES}" ]; then
    ### Start Archeiving ###
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"

    ### Check Archieval Success or not ###
    if [ -f $ZIP_FILE_NAME ]
    then
        echo -e "Archeival ... $G SUCCESS $N"

        ### Delete if success ###
        while IFS= read -r filepath
        do
            echo "Deleting the file: $filepath"
            rm -rf $filepath
            echo "Deleted the file: $filepath"
        done <<< $FILES
    else
        echo "Archieval ... $R FAILURE $N"
        exit 1
    fi
else
    echo -e "No files to archeive ... $Y SKIPPING $N"
fi