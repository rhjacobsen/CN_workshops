#!/bin/sh
IFACES="all
default
lo
eth0
eth1
eth2
eth3"

for iface in $IFACES
do
  sysctl -w net.ipv6.conf.$iface.autoconf=0 > /dev/null
  sysctl -w net.ipv6.conf.$iface.dad_transmits=0 > /dev/null
  sysctl -w net.ipv6.conf.$iface.accept_ra=0 > /dev/null
  sysctl -w net.ipv6.conf.$iface.router_solicitations=0 > /dev/null
  sysctl -w net.ipv6.conf.$iface.forwarding=1 > /dev/null
done

touch /etc/quagga/ospfd.conf
touch /etc/quagga/bgpd.conf
touch /etc/quagga/zebra.conf

chown -R quagga:quagga /etc/quagga

/usr/sbin/zebra -d
/usr/sbin/ospfd -d
/usr/sbin/bgpd -d

vtysh
