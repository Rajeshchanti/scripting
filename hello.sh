#!/bin/bash

VALIDATE(){
    if [ "$USER_NAME" = "admin" ] && [ "$PASSWORD" = "admin" ] && [ $1 -ne 0 ]
    then
        echo "Wellcome to Tech Tree $USER_NAME"  
    else
        echo "Invalid credentials" 
        exit 1     
    fi
}

USER_VALIDATION(){
    if [ "$AGE" -ge 19 ] 
    then
        echo "Hello!!! $NAME you are Eligible"
    else
        echo "Hello $NAME your are age is $AGE. So! you are not eligible"
        
    fi
}
echo "Enter Username:"
read -s USER_NAME
echo "Enter Password:"
read -s PASSWORD

VALIDATE $?

echo "*************Enter User Details*****************"
echo "Enter Name Age Gender"
read -r NAME AGE GENDER

echo "Name:$NAME Age:$AGE Gender:$GENDER"
USER_VALIDATION