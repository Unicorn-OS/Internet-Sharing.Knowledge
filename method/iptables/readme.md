# Internet Sharing with IPtables
Iptables & a DHCP server (like dnsmasq) can be used to act as a Router with NAT! This lets you forward any interface to any other interface! Including tethering "Mobile data" to a ethernet LAN.

# Guide: Enable NAT With iptables
basic:
- https://wiki.archlinux.org/title/Internet_sharing#With_iptables

more features & security:
- https://wiki.archlinux.org/title/Simple_stateful_firewall

# How it works:
## Connection tracking
https://en.wikipedia.org/wiki/Netfilter#Connection_tracking

>NAT relies on this information to translate all related packets in the same way, and iptables can use this information to act as a stateful firewall.
