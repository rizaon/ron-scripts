#!/bin/bash

apt-get update
apt-get install -y nfs-common htop tmux maven protobuf-compiler libprotobuf-dev libprotobuf-java
mount 10.1.1.6:/home/ubuntu /home/ubuntu
