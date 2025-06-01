# https://wiki.archlinux.org/title/Internet_sharing#With_iptables

internet0=enp1s0
net0=ens1

iptables -t nat -A POSTROUTING -o $internet0 -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $net0 -o $internet0 -j ACCEPT
