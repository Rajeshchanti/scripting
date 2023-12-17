#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $? -ne 0]
    then
        echo "installation is failed"
        exit 1
    else
        echo "Installation is Success"
    fi
}

    if [ $ID -ne 0 ]
    then
        echo "You are not root"
        exit 1
    else
        echo "You are a root"
    fi

yum install git -y

VALIDATE