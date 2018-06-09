#!/bin/sh

DEVOPS_REPO_NAME="devops"

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install software-properties-common
sudo apt-get remove ansible -y
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y git ansible

git config --global user.email "valentin.mihaylov@gmail.com"
git config --global user.name "Valentin Mihaylov"

if [ ! -d "$DEVOPS_REPO_NAME" ]; then
    git clone https://mihaylov-software@bitbucket.org/mihaylov-software/devops.git
else
    cd $DEVOPS_REPO_NAME
    git stash && git pull
    cd ..
fi

cd $DEVOPS_REPO_NAME/provision
ansible-playbook installation.yml --sudo -K -c local -i "localhost,"
