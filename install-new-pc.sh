#!/bin/bash

# $1 like user@pc.local
# $2 like /path/to/bitbucket-pass-file

scp $1:$2 $2

wget -O- https://raw.githubusercontent.com/valentinmihaylov/provision/master/bootstrap.sh | bash -s $2
