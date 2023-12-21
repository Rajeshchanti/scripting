#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR="/tmp/scripts/logs.log"
if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R No such $SOURCE_DIR directory found $N"
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log") #finding old files

while IFS= read -r line
do
    echo "Deleting file:$line"
    rm -rd $line
done <<< FILES_TO_DELETE