#!/bin/bash

PORT="4323"


PORT_STATUS=$(ss -tnlup | grep -wo $PORT)

if [ $PORT_STATUS ]; then
    echo "True"
else
    echo "False"
fi
