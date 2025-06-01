Based on guide: https://wiki.archlinux.org/title/Internet_sharing

This works in a KVM virtual machine! Tested with physical Ethernet NIC using VFIO.passthrough to guest!
Internet WAN is on `default` KVM NAT network. Internet sharing to LAN with DHCP is on physical passthroughed ethernet.

Default subnet is 10.42.0.0/24 to match the one Network Manager GUI creates! This can be changed with `subnet=` variable in case of conflict.

Because this uses simple utilities like iptables, it should also be portable to Android!

# Notes:
os: Ubuntu 25.05 Desktop

virtualization: true
- hypervisor: KVM

hardware passthrough:
- VFIO PCIe ethernet interface

uses:
- sysctl
- netplan
- iptables
- dnsmasq
