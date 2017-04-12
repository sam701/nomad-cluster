#!/bin/sh

ip addr | grep {{consul_client_ip}} > /dev/null
if [ $? != 0 ]; then
  ip address add dev {{cluster_network_interface}} scope link {{consul_client_ip}}/16
fi
