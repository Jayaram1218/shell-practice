#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]

then

    echo  -e "$R ERROR:: Please run this command with Root access $N"

    exit 1 #give other than 0 upto 127

else 

    echo " You are running with root access"

fi

# VALIDATE function takes input as exit status, what command they tried to install
VALIDATE() {
 if [ $1 -eq 0 ]
        then 
            echo -e "Installing $2 ... $G successful $N"
        else 
            echo -e "Installing $2 ... $R Failure $N"
            exit 1
        fi
}

dnf list installed mysql 

#check already installed or not. If installed $? is 0 

# If not installed $? is not 0. expression is true


if [ $? -ne 0 ]

then  

    echo -e "Mysql is not installed... going to install it"
    dnf install mysql -y
    VALIDATE $? "MySQL"

else 

    echo -e "Nothing to do.. mysql... $Y  already installed $N"
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

    echo -e "Nothing to do.. Puthon3... $Y  already installed $N"
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

    echo -e "Nothing to do.. nginx... $Y  already installed $N"
fi