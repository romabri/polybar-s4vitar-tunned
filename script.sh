#!/bin/sh


interfaces=$(ip addr | grep '^[0-9]' | awk -F ': ' '{print $2}')

ip_address=""

for interface in $interfaces; do
    ip=$(ip addr show $interface | grep -oP 'inet \K[\d.]+')
    if [ -n "$ip" ] && [ "$interface" != "lo" ]; then
        ip_address="$ip"
        break  
    fi
done

if [ -n "$ip_address" ]; then
    echo "%{F#2495e7} %{F#ffffff}$ip_address%{u-}"
else
    echo "No conectado"
fi
