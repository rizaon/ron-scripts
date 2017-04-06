#!/bin/bash

sudo sed -i "s/#dns_domain = openstacklocal/dns_domain = ucare.edu./" /etc/neutron/neutron.conf 
sudo sed -i "s/#dhcp_domain = openstacklocal/dhcp_domain = ucare.edu./" /etc/neutron/dhcp_agent.ini 
sudo sed -i "s/extension_drivers = port_security/extension_drivers = port_security,dns/" /etc/neutron/plugins/ml2/ml2_conf.ini

# following steps need to be done manually
# - screen -x stack
# - ctrl+a+n to q-dhcp
# - ctrl+c, then rerun last command
