#!/bin/bash

#Declare variable
ART_NAME="test-server1"
DIR_PATH="/var/www/test-server1"
PORT="9999"
SERVICE_NAME="apache2"

#Checking Port status
echo "********* Checking Port status *********"
PORT_STATUS=$(ss -tnlup | grep -wo $PORT)

if [ $PORT_STATUS ]; then
    echo "PORT no Available!"
    exit
else
    echo "PORT AVAILABLE!"
fi

#creating document directory
echo "********* creating documentroot directory $DIR_PATH **********"
mkdir $DIR_PATH

#Creating text file for testing
echo "********* creating test file in $DIR_PATH **********"
echo "Working" >$DIR_PATH/testfile.txt

#creating virtualhost configuration file
echo "********* creating virtualhost configuration file **********"
cat >/etc/$SERVICE_NAME/sites-available/$ART_NAME.conf <<EOF
Listen $PORT
<VirtualHost *:$PORT>

	DocumentRoot /var/www/$ART_NAME

	ErrorLog /var/log/$SERVICE_NAME/$ART_NAME.error.log
	CustomLog /var/log/$SERVICE_NAME/$ART_NAME.access.log combined

</VirtualHost>

EOF

#enableing site
echo "********* enableing site $ART_NAME **********"
a2ensite $ART_NAME.conf

#restarting apache2 service
echo "********* restarting apache2 service **********"
systemctl restart $SERVICE_NAME
systemctl reload $SERVICE_NAME

echo "############### COMPLETE ################"
