#!/usr/bin/bash

printf "======\tChoose you Wifi\t======\n"
nmcli device wifi list
printf "\n"
read -p "Enter SSID: " -r id
ssid="$id"
res=""
while :
do
    read -p "Is there a password [Y/n] " -r response
     res=${response,,}
     if [[ "$res" =~ ^(y|yes) ]] || [[ -z "$res" ]]; then
        read -p "Enter password: " -r -s password
        passwd="$password"
	break
    elif [[ "$res" =~ ^(n|no) ]]; then
        break
    fi
done
printf "\nConnecting to Network...\n"
nmcli device wifi connect "$ssid" password "$passwd"
exit 0
