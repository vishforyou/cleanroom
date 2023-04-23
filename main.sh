#!/bin/bash

cp deleteuser.sh /root
chmod +x /root/deleteuser.sh
cp run-before-shutdown.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable run-before-shutdown.service
