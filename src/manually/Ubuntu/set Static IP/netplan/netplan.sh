# https://linuxconfig.org/how-to-configure-static-ip-address-on-ubuntu-18-04-bionic-beaver-linux

sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd

sudo rm /etc/netplan/*
sudo cp template/KVM.NAT and Static IP.yaml /etc/netplan/01-network-manager-all.yaml

sudo netplan --debug apply
