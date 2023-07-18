#!/bin/bash

echo "######################################"
date
if [ -f /var/run/httpd/httpd.pid ]
then
	echo "httpd service [running]"
else
	echo "httpd service [not running]"
	echo "Sarting httpd service..."
	systemctl start httpd
	echo "httpd service started successfully."	
fi
echo "######################################"
