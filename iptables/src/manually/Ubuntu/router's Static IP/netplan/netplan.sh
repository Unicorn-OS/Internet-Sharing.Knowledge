# https://linuxconfig.org/how-to-configure-static-ip-address-on-ubuntu-18-04-bionic-beaver-linux

toFile=/etc/netplan/01-network-manager-all.yaml

sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd

sudo rm /etc/netplan/*

# You have to set IP in netplan to match subnet! example: subnet="10.42.0.0" => 10.42.0.1
sudo cp template/KVM.NAT\ \&\ Static\ IP.yaml $toFile

#-rw-r--r--   1 root root
sudo chown root:root $toFile
sudo chmod 644 $toFile

sudo netplan --debug apply

# Reboot required so that netplan's `renderer: networkd` overrides NetworkManager
sudo reboot
