#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then

    echo "ERROR:: Please run this command with Root access"

    exit 1 #give other than 0 upto 127

else 

    echo " You are running with root access"

fi

dnf install mysql -y

if [ $? -eq 0 ]

then 

    echo "Installing MYSQL ... successful"

else 

    echo "Installing MYSQL ... Failure"

    exit 1

fi
