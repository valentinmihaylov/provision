#!/bin/sh

### param 1 - path to bitbucket pass file
### param 2 - git branch

DEVOPS_REPO_NAME="devops"

if [ ! -d "$DEVOPS_REPO_NAME" ]; then

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
    git clone https://mihaylov-software:$(cat $1)@bitbucket.org/mihaylov-software/$DEVOPS_REPO_NAME.git
    cd $DEVOPS_REPO_NAME
    git checkout -b $2 origin/$2
else
    cd $DEVOPS_REPO_NAME
    git stash && git checkout $2 && git pull
fi

echo -e "\n###\nstart provisioning\n###\n"
./install-laptop.sh
