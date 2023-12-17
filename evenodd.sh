#!/bin/bash

echo "Enter Num:"
read NUM

    if [ '$NUM % 2' == 0 ]
    then
        echo "$NUM is EVEN"
    else
        echo "$NUM Not EVEN Number"
    fi