#!/bin/bash 
sudo apt install mailutils
sudo apt-get install ssmtp
sudo chmod 777 /etc/ssmtp
sudo chmod 777 /etc/ssmtp/ssmtp.conf
echo "\nEnter Your Mail: "
read mail
echo "\nEnter Mail Password: "
read pass
echo "\nPlease Make sur that you have permissions for less secure apps in gmail"
echo "
FromLineOverride=YES
AuthUser=$mail
AuthPass=$pass
mailhub=smtp.gmail.com:587
UseSTARTTLS=YES">> /etc/ssmtp/ssmtp.conf
echo "Enter Service you want to check!!"
read service
if (( $(ps -ef | grep -v grep | grep $service | wc -l) > 0 )) 
then echo "$service is running!!!" 
else echo "Service not running" | mail -s "Service Not running" handgenishant@gmail.com
fi
