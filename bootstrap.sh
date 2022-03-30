#!/bin/sh

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
if [ ! -d "$DEVOPS_REPO_NAME" ]; then
    git clone https://mihaylov-software@bitbucket.org/mihaylov-software/devops.git
else
    cd $DEVOPS_REPO_NAME
    git stash && git pull
    cd ..
fi

sudo apt-get remove git -y # git will probably have an old version

echo -e "\n###\nstart provisioning\n###\n"
cd $DEVOPS_REPO_NAME/provision
./install-laptop.sh
