#!/usr/bin/env bash

echo "--------------------START SCRIPT------------------------------"

yum install -y bash-completion tree vim gdisk screen bc 

#SELinux to permissive
setenforce 0
mkdir -p ~root/.ssh
cp ~vagrant/.ssh/auth* ~root/.ssh

echo "------------------------------------------------------------"
lsblk
echo "------------------------ df -h ------------------------------------"
df -h

echo "--------------------END SCRIPT------------------------------"






