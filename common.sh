#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/roboshop"
logs_file="${logs_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

check_root(){
if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access"
    exit 1
fi
}

mkdir -p $logs_folder
echo "Script  started executing at $(date +"%F %T")" &>> $logs_file
validate(){
    if [ $? -ne 0 ]; then
        echo -e "${2} ${R}Failed${N}"  | tee -a $logs_file
    else
        echo -e "${2} ${G}Success${N}" | tee -a $logs_file
    fi
}

echo "$(timestamp) [INFO] === Script started Execution ===" | tee -a $logs_file