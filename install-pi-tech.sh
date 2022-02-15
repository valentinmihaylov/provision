#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install software-properties-common git ansible -y

git config --global user.email "valentin.mihaylov@gmail.com"
git config --global user.name "Valentin Mihaylov"

git clone https://mihaylov-software@bitbucket.org/mihaylov-software/devops.git

cd devops/raspi
./install-pi-tech.sh
