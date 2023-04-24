#!/bin/bash

## copy files
cp deleteuser.sh /root
cp run-before-shutdown.service /etc/systemd/system/

# Setup for delete and creation
chmod +x /root/deleteuser.sh
systemctl daemon-reload
systemctl enable run-before-shutdown.service
# Disable IPv6
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
/usr/sbin/sysctl -p

# clam
apt-get update -y
apt-get install clamav clamav-daemon
cp hostcron /etc/cron.d/

# banner
cp gdm /etc/dconf/profile
cp 01-banner-message /etc/dconf/db/gdm.d/01-banner-message
dconf update

exit 0



