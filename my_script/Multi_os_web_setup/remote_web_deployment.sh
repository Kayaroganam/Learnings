#!/bin/bash

for host in $(cat hosts.txt); do
    echo "--> $host"
    scp web_deployment.sh vagrant@$host:/tmp/
    ssh vagrant@$host sudo /tmp/web_deployment.sh
    #ssh vagrant@$host sudo systemctl disable firewalld
    sleep 1
done
