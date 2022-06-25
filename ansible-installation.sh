#!/bin/bash

apt update
sleep 20
apt install software-properties-common
sleep 5
add-apt-repository --yes --update ppa:ansible/ansible
sleep 10
apt install ansible -y
