#!/bin/bash
## copy files
cp hosts /etc/
cp deletedir.sh /root
cp run-before-shutdown-wrkspaces.service /etc/systemd/system/

# Setup for delete and creation
chmod +x /root/deletedir.sh
systemctl daemon-reload
systemctl enable run-before-shutdown-wrkspaces.service

curl https://intoli.com/install-google-chrome.sh | bash
