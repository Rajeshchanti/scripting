#!/bin/bash
DATE=$(date)
echo "Enter Num:"
read NUM
EXP=$(( $NUM % 2 ))

    if [ $EXP -eq 0 ]
    then
        echo "$NUM is EVEN"
    else
        echo "$NUM Not EVEN Number"
    fi
