# https://wiki.archlinux.org/title/Internet_sharing#Assigning_IP_addresses_to_the_client_PC(s)

internet0=enp1s0
net0=ens1
subnet="10.42.0.0/24"

iptables -I INPUT -p udp --dport 67 -i net0 -j ACCEPT
iptables -I INPUT -p udp --dport 53 -s ${subnet} -j ACCEPT
iptables -I INPUT -p tcp --dport 53 -s ${subnet} -j ACCEPT
