#!/bin/bash

for i in `seq 1 128`;
do
  openstack server create --image trusty-java --flavor sck.small \
    --availability-zone nova --nic net-id=hadoopnet --security-group default \
    --key-name ucare-key --user-data ./cloudinit.sh node-$i
done
