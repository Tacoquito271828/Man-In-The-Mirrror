#!/bin/bash

echo "Usage ./Man-in-The-Mirror.sh [Interface] [PUERTO/S; /Separados por coma; 0 para puertos default]"
echo "Ejemplo ./Man-in-The-Mirror.sh eth0 80,443,445,139,3389,25

ip=$(ifconfig $1 | grep -i "inet" | grep -v inet6|  awk '{print $2}')

if [ "$2" -eq "0" ]; then sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination $ip:80
sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination $ip:443



sudo iptables -t nat -A POSTROUTING -j MASQUERADE
exit 1
fi

im=$(echo $2 | sed 's/,/\n/g' | wc -l)

i=1

while [ "$i" -le "$im" ]; do sudo iptables -t nat -A PREROUTING -p tcp --dport $(echo $2 | awk -F ',' -v i=$i '{print $i}') -j DNAT --to-destination $ip:$(echo $2 | awk -F ',' -v i=$i '{print $i}'); i=$(($i+1)); done && sudo iptables -t nat -A POSTROUTING -j MASQUERADE

echo "Nueva tabla: \n"
sudo iptables -L -t nat
