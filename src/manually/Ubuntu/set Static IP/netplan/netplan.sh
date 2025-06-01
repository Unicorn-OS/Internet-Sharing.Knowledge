# https://linuxconfig.org/how-to-configure-static-ip-address-on-ubuntu-18-04-bionic-beaver-linux

sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd

sudo rm /etc/netplan/*

# You have to set IP in netplan to match subnet! example: subnet="10.42.0.0" => 10.42.0.1
sudo cp template/KVM.NAT and Static IP.yaml /etc/netplan/01-network-manager-all.yaml

sudo netplan --debug apply
