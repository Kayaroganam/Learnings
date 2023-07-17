#!/bin/bash

sudo systemctl stop httpd
sudo yum remove httpd -y
rm -rf /var/www/http/*