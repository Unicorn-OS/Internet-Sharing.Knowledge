# https://wiki.archlinux.org/title/Internet_sharing#With_iptables
#>Read the iptables article for more information (especially saving the rule and applying it automatically on boot). There is also an excellent guide on iptables Simple stateful firewall.

# This doesn't persist on Reboot. To Do!
internet0=enp1s0
net0=ens1

iptables -t nat -A POSTROUTING -o $internet0 -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $net0 -o $internet0 -j ACCEPT
