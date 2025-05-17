#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then

    echo "ERROR:: Please run this command with Root access"

    exit 1 #give other than 0 upto 127

else 

    echo " You are running with root access"

fi

# VALIDATE function takes input as exit status, what command they tried to install
VALIDATE() {
 if [ $1 -eq 0 ]
        then 
            echo "Installing $2 ... successful"
        else 
            echo "Installing $2 ... Failure"
            exit 1
        fi
}

dnf list installed mysql 

#check already installed or not. If installed $? is 0 

# If not installed $? is not 0. expression is true


if [ $? -ne 0 ]

then  

    echo "Mysql is not installed... going to install it"
    dnf install mysql -y
    VALIDATE $? "MySQL"

else 

    echo "mysql is already installed... nothing to do"
fi

dnf list installed python3 

#check already installed or not. If installed $? is 0 

# If not installed $? is not 0. expression is true


if [ $? -ne 0 ]

then  

    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"

else 

    echo "python3 is already installed... nothing to do"
fi

dnf list installed nginx 

#check already installed or not. If installed $? is 0 

# If not installed $? is not 0. expression is true


if [ $? -ne 0 ]

then  

    echo "nginx is not installed... going to install it"
    dnf install nginx -y
    VALIDATE $? "nginx"

else 

    echo "nginx is already installed... nothing to do"
fi