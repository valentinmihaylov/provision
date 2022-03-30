#!/bin/sh

echo -e "\n###\nupdate system, install git and ansible\n###\n"
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install software-properties-common git ansible -y

echo -e "\n###\nconfigure git\n###\n"
git config --global user.email "valentin.mihaylov@gmail.com"
git config --global user.name "Valentin Mihaylov"

echo -e "\n###\nget repo from bitbucket\n###\n"
git clone https://mihaylov-software@bitbucket.org/mihaylov-software/devops.git

echo -e "\n###\nstart provisioning\n###\n"
cd devops/raspi
./install-pi-tech.sh
