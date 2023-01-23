#!/bin/sh

# $1 like user@pc.local
# $2 like /path/to/bitbucket-pass-file

sudo mkdir -p /install/
sudo chmod 777 /install/
scp $1:$2 $2
scp $1:~/.ssh/id_rsa ~/.ssh/id_rsa

echo -e "\n###\nconfigure git\n###\n"

sudo apt install git -y
git config --global user.email "valentin.mihaylov@gmail.com"
git config --global user.name "Valentin Mihaylov"
