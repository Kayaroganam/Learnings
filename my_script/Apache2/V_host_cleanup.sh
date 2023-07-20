#!/bin/bash

for conf_file in $(ls /etc/apache2/sites-available/); do
    if [ $conf_file == "000-default.conf" ] || [ $conf_file == "default-ssl.conf" ]; then
        echo "skip deletion."
    else
        echo "Disableing site $conf_file"
        echo "Deleting $conf_file file"
        rm -vf rm /etc/apache2/sites-available/$conf_file
    fi

done

systemctl restart apache2

