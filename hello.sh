#!/bin/bash

echo "Enter Username:"
read -s USER_NAME
echo "Enter Password:"
read -s PASSWORD

VALIDATE(){
    if [ $USER_NAME -e admin ]
    then
        echo "Wellcome to Tech Tree $USER_NAME"
    else
        echo "Invalid credentials"
    fi
}
