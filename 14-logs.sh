#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"

#SCRIPT_NAME=$(echo 14-logs.sh | cut -d "." -f1)

SCRIPT_NAME=$(echo $0 | cut -d "." -f1)

LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo "Script started executing at: $(date)" &>>$LOG_FILE

if [ $USERID -ne 0 ]

then

    echo  -e "$R ERROR:: Please run this command with Root access $N" &>>$LOG_FILE

    exit 1 #give other than 0 upto 127

else 

    echo " You are running with root access" &>>$LOG_FILE

fi

# VALIDATE function takes input as exit status, what command they tried to install
VALIDATE() {
 if [ $1 -eq 0 ]
        then 
            echo -e "Installing $2 ... $G successful $N" &>>$LOG_FILE
        else 
            echo -e "Installing $2 ... $R Failure $N" &>>$LOG_FILE
            exit 1
        fi
}

dnf list installed mysql &>>$LOG_FILE

#check already installed or not. If installed $? is 0 

# If not installed $? is not 0. expression is true


if [ $? -ne 0 ]

then  

    echo -e "Mysql is not installed... going to install it" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL"

else 

    echo -e "Nothing to do.. mysql... $Y  already installed $N" &>>$LOG_FILE
fi

dnf list installed python3  &>>$LOG_FILE

#check already installed or not. If installed $? is 0 

# If not installed $? is not 0. expression is true


if [ $? -ne 0 ]

then  

    echo "python3 is not installed... going to install it" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"

else 

    echo -e "Nothing to do.. Puthon3... $Y  already installed $N" &>>$LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE

#check already installed or not. If installed $? is 0 

# If not installed $? is not 0. expression is true


if [ $? -ne 0 ]

then  

    echo "nginx is not installed... going to install it" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"

else 

    echo -e "Nothing to do.. nginx... $Y  already installed $N" &>>$LOG_FILE
fi