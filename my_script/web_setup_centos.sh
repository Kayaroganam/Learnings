#!/bin/bash

echo "Web deployment."

#Install dependencies
echo "##########################"
echo "Installing dependencies."
echo "##########################"
sudo yum install httpd wget curl unzip -y


#Start and enable service
echo "##########################"
echo "Starting and enabling service."
echo "##########################"
sudo systemctl start httpd
sudo systemctl enable httpd

#Create temp folder
echo "##########################"
echo "Creating folder as temp."
echo "##########################"
mkdir -p /tmp/webfiles && cd /tmp/webfiles

#Download soruce code
echo "##########################"
echo "Downloading Source code."
echo "##########################"
wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip

#Extract Source code
echo "##########################"
echo "Extracting Source code."
echo "##########################"
unzip 2136_kool_form_pack.zip

#Copy files
echo "##########################"
echo "Copying source code to webserver!"
echo "##########################"
sudo cp -rvf 2136_kool_form_pack/* /var/www/html

#Restart services
echo "##########################"
echo "Restarting service."
echo "##########################"
sudo systemctl restart httpd

#show ip address
ip a

