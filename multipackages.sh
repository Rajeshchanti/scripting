#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILENEW="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILENEW

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ......... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ......... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R Run the command with root access $N"
    exit 1
else
    echo -e "$G running with root access $N"
fi

for package in $@
do
    yum list installed $package &>> $LOGFILENEW #check installed or not
    if [ $? -ne 0 ] #if not installed
    then
        yum install $package -y &>> $LOGFILENEW # install the package
        VALIDATE $? "$package installation is"
    else
        echo -e "$package is already installed ..... $Y SKIPPED $N"
    fi
done
