#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2.......installation is failed"
        exit 1
    else
        echo "$2.......Installation is Success"
    fi
}

    if [ $ID -ne 0 ]
    then
        echo "You are not root"
        exit 1
    else
        echo "You are a root"
    fi

yum install mysql -y

VALIDATE $? "mysql"