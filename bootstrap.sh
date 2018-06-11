#!/bin/sh

DEVOPS_REPO_NAME="devops"

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install software-properties-common git ansible -y

git config --global user.email "valentin.mihaylov@gmail.com"
git config --global user.name "Valentin Mihaylov"

if [ ! -d "$DEVOPS_REPO_NAME" ]; then
    git clone https://mihaylov-software@bitbucket.org/mihaylov-software/devops.git
else
    cd $DEVOPS_REPO_NAME
    git stash && git pull
    cd ..
fi

sudo apt-get remove git -y # git will probably have an old version

cd $DEVOPS_REPO_NAME/provision
./install-laptop.sh
