#!/bin/bash

sudo ip netns ls
sudo ip netns exec qrouter-7f7ddb36-c53a-4ad8-a49a-6bfb010a225b ssh -i ~/.ssh/ucare-key.pem ubuntu@10.1.1.6
