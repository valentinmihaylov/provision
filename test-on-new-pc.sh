#!/bin/bash

# $1 like user@pc.local
# $2 like /path/to/bitbucket-pass-file

wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/scripts/prepare-system.sh | bash
wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/scripts/prepare-repo-access.sh | bash -s $1 $2

DEVOPS_REPO_NAME="devops"

echo -e "\n###\nget repo from bitbucket\n###\n"
git clone https://mihaylov-software:$(cat $2)@bitbucket.org/mihaylov-software/$DEVOPS_REPO_NAME.git

echo -e "\n###\nstart vagrant\n###\n"
cd $DEVOPS_REPO_NAME/vagrant
.run-vagrant.sh
