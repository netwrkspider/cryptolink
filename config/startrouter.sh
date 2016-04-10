#!/bin/bash

echo "++++++++++++++++++++++++++++++++++++++++++"
echo "+  cryptolink wireless starter script    +"
echo "++++++++++++++++++++++++++++++++++++++++++"


/etc/init.d/networking restart > /dev/null 2>&1

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

service dnsmasq restart > /dev/null 2>&1
service hostapd restart > /dev/null 2>&1

service tor stop > /dev/null 2>&1 
service motion stop > /dev/null 2>&1
service lighttpd start > /dev/null 2>&1
service polipo stop > /dev/null 2>&1

#banner smokelink started
