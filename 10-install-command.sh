#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then

    echo "ERROR:: Please run this command with Root access"

else 

    echo " You are running with root access"

fi