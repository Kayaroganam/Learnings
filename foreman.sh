#!/bin/bash


#Declare variable
FQDN="foreman.example.com"
TMP_FOLDER="/tmp/foreman"

echo "-----------------------------"
echo "Update system package list."
echo "-----------------------------"
sudo apt update -y

#Configure FQDN of the Foreman server.
echo "-----------------------------"
echo "Change the hostname."
echo "-----------------------------"
sudo hostnamectl set-hostname $FQDN

#Edit the /etc/hosts file.
echo "-----------------------------"
echo "Adding FQDN in /etc/hosts file."
echo "-----------------------------"
sudo echo "10.191.255.125  $FQDN" >> /etc/hosts

#Install required packages.
echo "-----------------------------"
echo "Install required packages."
echo "-----------------------------"
sudo apt install -y apt-transport-https wget gpg gnupg ca-certificates

#Creating Tmp directory to download puppet repo
echo "-----------------------------"
echo "Creating Tmp directory."
echo "-----------------------------"
mkdir $TMP_FOLDER && cd $TMP_FOLDER

#Download Puppet repository.
echo "-----------------------------"
echo "Download Puppet repository."
echo "-----------------------------"
wget https://apt.puppet.com/puppet6-release-focal.deb

#Add Puppet repository.
echo "-----------------------------"
echo "Add Puppet repository."
echo "-----------------------------"
sudo dpkg -i ./puppet6-release-focal.deb

Add Foreman repository to system.
echo "-----------------------------------"
echo "Add Foreman repository to system."
echo "-----------------------------------"
echo "deb http://deb.theforeman.org/ focal 3.0" | sudo tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 3.0" | sudo tee -a /etc/apt/sources.list.d/foreman.list

#Download Foreman GPG keys.
echo "-----------------------------------"
echo "Download Foreman GPG keys."
echo "-----------------------------------"
wget -q https://deb.theforeman.org/pubkey.gpg -O- | sudo apt-key add -

#Update system package list.
echo "-----------------------------"
echo "Update system package list."
echo "-----------------------------"
sudo apt -y update

#Download the installer.
echo "-----------------------------"
echo "Download the installer."
echo "-----------------------------"
sudo apt -y install foreman-installer

#Run Foreman installation.
echo "-----------------------------"
echo "Run Foreman installation."
echo "-----------------------------"
sudo foreman-installer

#Allow ports 80 in firewall.
echo "-----------------------------"
echo "Allow ports 80."
echo "-----------------------------"
sudo ufw allow 80

#Remove Tmp directory
echo "-----------------------------"
echo "Remove Tmp directory"
echo "-----------------------------"
sudo rm -rfv $TMP_FOLDER