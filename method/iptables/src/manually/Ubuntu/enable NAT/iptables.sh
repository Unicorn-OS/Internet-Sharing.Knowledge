# Run this as sudo

# https://wiki.archlinux.org/title/Internet_sharing#With_iptables
#>Read the iptables article for more information (especially saving the rule and applying it automatically on boot). There is also an excellent guide on iptables Simple stateful firewall.

internet0=enp1s0
net0=ens1
iptables_dir=/etc/iptables

iptables -t nat -A POSTROUTING -o $internet0 -j MASQUERADE
# implements Connection Tracking https://en.wikipedia.org/wiki/Netfilter#Connection_tracking
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $net0 -o $internet0 -j ACCEPT

# Persist on Reboot
mkdir -p $iptables_dir
iptables-save -f ${iptables_dir}/rules.v4

iptables_persistent(){
	#sudo apt install iptables-persistent	# systemd service
	# if No Package available - build from source!	
	# This build requires manual input, at certain steps! TODO: Automate
	cd iptables-persistent
	wget -c https://raw.githubusercontent.com/NetworkingUniversity/IPtables.Knowledge/refs/heads/main/Persist%20on%20Reboot/iptables-persistent%20package/build%20from%20source%3A/build.sh
	chmod +x build.sh
	. build.sh
}

sudo systemctl enable netfilter-persistent.service

test(){
	sudo systemctl status netfilter-persistent.service
}
