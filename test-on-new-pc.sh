#!/bin/bash

# $1 like user@pc.local
# $2 like /path/to/bitbucket-pass-file

scp $1:$2 $2

DEVOPS_REPO_NAME="devops"

echo -e "\n###\nupdate system, install git and ansible\n###\n"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install software-properties-common git ansible -y

echo -e "\n###\nconfigure git\n###\n"
git config --global user.email "valentin.mihaylov@gmail.com"
git config --global user.name "Valentin Mihaylov"

echo -e "\n###\nget repo from bitbucket\n###\n"
git clone https://mihaylov-software:$(cat $1)@bitbucket.org/mihaylov-software/devops.git

echo -e "\n###\nstart vagrant\n###\n"
cd $DEVOPS_REPO_NAME/vagrant
.run-vagrant.sh
