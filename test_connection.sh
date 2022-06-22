#!/bin/bash

# usage: ./test_connection.sh <ip> <port>
# example: ./test_connection.sh 127.0.0.1 22

# bash test_connection.sh &> /dev/null
# if [ $? -ne 0 ]; then
#         echo "connection refused"
# fi

[ ! -x /usr/bin/telnet ] && echo "commd 'telnet' no found" && exit 1

result=`(telnet $1 $2 <<EOF
quit
EOF
) 2>&1`

if echo $result | egrep "\^]" &> /dev/null; then
        echo "$1 $2 is up"
        exit 0
else
        echo "$1 $2 is down"
        exit 2
fi
