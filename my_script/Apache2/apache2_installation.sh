#!/bin/bash

apt --help &>/dev/null

if [ $? -eq 0 ]; then
    echo "Debian based OS."
    sudo apt install apache2 -y
else
    echo "RPM Based OS."
    sudo yum install httpd
fi
