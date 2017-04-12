#!/bin/bash

neutron subnet-update hadoopnet-subnet1 --allocation-pools type=dict list=true start=10.1.1.5,end=10.1.1.250  start=10.1.2.5,end=10.1.2.250 start=10.1.3.5,end=10.1.3.250 start=10.1.4.5,end=10.1.4.250

