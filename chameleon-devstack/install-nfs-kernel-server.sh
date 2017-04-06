#/bin/bash

sudo apt-get install nfs-kernel-server
sudo service nfs-kernel-server stop
sudo sh -c 'echo "/home/ubuntu       10.1.0.0/16(rw,sync,no_subtree_check)" >> /etc/exports'
sudo service nfs-kernel-server start

