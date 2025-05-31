# https://linuxconfig.org/how-to-configure-static-ip-address-on-ubuntu-18-04-bionic-beaver-linux

sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd

sudo rm /etc/netplan/*
sudo cp template/01-network-manager-all.yaml /etc/netplan/

sudo netplan --debug apply
