# https://wiki.archlinux.org/title/Internet_sharing

file=/etc/sysctl.d/10-internet-sharing.conf

# Enable packet forwarding
sudo tee $file >/dev/null <<'EOL'
net.ipv4.ip_forward = 1
net.ipv4.conf.all.forwarding = 1
net.ipv6.conf.all.forwarding = 1
EOL

# load config
sudo sysctl --load=$file
