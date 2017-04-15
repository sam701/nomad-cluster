#!/bin/sh

ip addr | grep {{consul_client_ip}} > /dev/null
if [ $? != 0 ]; then
  ip address add dev {{consul_client_interface}} scope link {{consul_client_ip}}/16
fi
