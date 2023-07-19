#!/bin/bash

yum --help &>/dev/null

if [ $? -eq 0 ]; then
    echo "RPM based machine."
    #Declaring variables
    Depend="httpd wget curl unzip"
    SERICE_NAME="httpd"
    TMP_FOLDER="/tmp/webfiles"
    SRC_URL="https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip"
    ART_NAME="2136_kool_form_pack"

    #Install dependencies
    echo "##########################"
    echo "Installing dependencies."
    echo "##########################"
    sudo yum install $Depend -y

    #Start and enable service
    echo "##########################"
    echo "Starting and enabling service."
    echo "##########################"
    sudo systemctl start $SERICE_NAME
    sudo systemctl enable $SERICE_NAME

    #Create temp folder
    echo "##########################"
    echo "Creating folder as temp."
    echo "##########################"
    mkdir -p $TMP_FOLDER && cd $TMP_FOLDER

    #Download soruce code
    echo "##########################"
    echo "Downloading Source code."
    echo "##########################"
    wget $SRC_URL

    #Extract Source code
    echo "##########################"
    echo "Extracting Source code."
    echo "##########################"
    unzip $ART_NAME.zip

    #Copy files
    echo "##########################"
    echo "Copying source code to webserver!"
    echo "##########################"
    sudo cp -rvf $ART_NAME/* /var/www/html

    #Restart services
    echo "##########################"
    echo "Restarting service."
    echo "##########################"
    sudo systemctl restart $SERICE_NAME

    #Remove tempfolder
    rm -rf $TMP_FOLDER

    #show ip address
    ip a
else
    echo "Debian based machine."
    #Declaring variables
    Depend="apache2 wget curl unzip"
    SERICE_NAME="apache2"
    TMP_FOLDER="/tmp/webfiles"
    SRC_URL="https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip"
    ART_NAME="2136_kool_form_pack"

    #Install dependencies
    echo "##########################"
    echo "Installing dependencies."
    echo "##########################"
    sudo yum install $Depend -y

    #Start and enable service
    echo "##########################"
    echo "Starting and enabling service."
    echo "##########################"
    sudo systemctl start $SERICE_NAME
    sudo systemctl enable $SERICE_NAME

    #Create temp folder
    echo "##########################"
    echo "Creating folder as temp."
    echo "##########################"
    mkdir -p $TMP_FOLDER && cd $TMP_FOLDER

    #Download soruce code
    echo "##########################"
    echo "Downloading Source code."
    echo "##########################"
    wget $SRC_URL

    #Extract Source code
    echo "##########################"
    echo "Extracting Source code."
    echo "##########################"
    unzip $ART_NAME.zip

    #Copy files
    echo "##########################"
    echo "Copying source code to webserver!"
    echo "##########################"
    sudo cp -rvf $ART_NAME/* /var/www/html

    #Restart services
    echo "##########################"
    echo "Restarting service."
    echo "##########################"
    sudo systemctl restart $SERICE_NAME

    #Remove tempfolder
    rm -rf $TMP_FOLDER

    #show ip address
    ip a
fi
