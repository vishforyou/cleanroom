#!/bin/bash

## delete user
cp deleteuser.sh /root
cp hosts to /etc/
chmod +x /root/deleteuser.sh
cp run-before-shutdown.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable run-before-shutdown.service

exit 0



