#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executed at $TIMESTAP" &>> LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.......installation is $R failed $N"
        exit 1
    else
        echo "$2.......Installation is $G Success $N"
    fi
}

    if [ $ID -ne 0 ]
    then
        echo "You are not root"
        exit 1
    else
        echo "You are a root"
    fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "mysql"