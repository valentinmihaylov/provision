#!/bin/sh

echo -e "\n###\nupdate system, install git and ansible\n###\n"

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install software-properties-common git ansible -y
