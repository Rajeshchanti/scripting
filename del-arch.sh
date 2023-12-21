#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=""
ACTION=""
DESTINATION=""
DAYS="2"
MEMORY=""

FILE=$(find $SOURCE_DIR -type f -mtime +14)

USAGE(){
    echo "USAGE:: $(basename $0) -s <source-dir> -a <archive|delete> -d <destination> -t <day> -m <memory-in-mb>"
    echo "Options::"
    echo "-s, specify the source directory"
    echo "-a, enter the action(archive|delete)"
    echo "-d, mention your destination"
    echo "-t, mention days"
    echo "-m, enter memory in mb"
    echo "-h, Diplay Help and Exit"
}

while getopts ":s:a:d:t:m:h" opt; do
    case $opt in
        s) SOURCE_DIR="$OPTARG";;
        a) ACTION="$OPTARG";;
        d) DESTINATION="$OPTARG";;
        t) DAYS="$OPTARG";;
        m) MEMORY="$OPTARG";;
        \?) echo "invalid options: -"$OPTARG"" >&2; USAGE; exit;;
        :) USAGE; exit;;
        h) USAGE; exit;;
    esac
done

if [ -z "$SOURCE_DIR" ]
then
    echo -e "$R -s please choose your directory $N"
    USAGE
    exit 1
elif [ -z "$ACTION" ]
then
    echo -e "$R -a please choose the action(acrchive|delete) $N"
    USAGE
    exit 1
elif [ -z "$MEMORY" ]
then
    echo -e "$R -m please select memory $N"
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R source directory::$SOURCE_DIR does not exist $N"
    exit 1
fi
if [ "$ACTION" == "delete" ]
then
    while IFS= read -r line
    do
        echo "Deleting file:$line"
        rm -rf $line
    done <<< FILE
elif [ "$ACTION" == "archive" ] && [ -z "$DESTINATION" ]
then
    while IFS= read -r line
    do
        echo "archive file:$line"
        zip -r  "$DESTINATION/$(basename "$line").zip"
    done <<< FILE
fi

