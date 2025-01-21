#!/bin/bash

set -e

if ! which python3 >/dev/null 2>&1
then
    echo "Don't have python3 please install"
    exit 1
fi

if ! which pip3 >/dev/null 2>&1
then
    echo "Don't have pip3 please install"
    if which yum >/dev/null 2>&1
    then
        sudo yum update -y
        sudo yum install python3-pip -y
    elif which apt-get >/dev/null 2>&1
    then
        sudo apt-get update -y
        sudo apt-get install python3-pip -y
    else
        echo "OS not match"
        exit 1
    fi
fi

echo "Install requirements packages"
sudo pip3 install -r requirements.txt


while true ; do
    echo "Enter option
        a get data from specific key
        b get json metadata
        c list all keys
        d exit"
    read x
      case $x in
         a) python3 get_key.py;;
         b) python3 get_metadata.py;;
         c) curl http://169.254.169.254/latest/meta-data/;;
         d) echo "You are now exiting the program"
            break;;
         *) echo "Invalid entry. Please try an option on display";;
      esac
done