#!/bin/bash

# $1 like user@pc.local
# $2 like /path/to/bitbucket-pass-file

wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/scripts/prepare-repo-access.sh | bash -s $1 $2

wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/bootstrap.sh | bash -s $2 master
