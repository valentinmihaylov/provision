#!/bin/sh

DEVOPS_REPO_NAME="devops"

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

