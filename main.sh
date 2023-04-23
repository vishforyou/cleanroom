#!/bin/bash

hname=$(hostname)
## delete user
cp deleteuser.sh /root
chmod +x /root/deleteuser.sh
cp run-before-shutdown.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable run-before-shutdown.service

# Check if user got deleted
# then create a new user
grep ^cleanroom /etc/passwd  
retval=$(echo $?)
if [ $retval -eq 1 ];then
useradd -d /home/${hname} -m ${hname}
echo "${hname}@arw" | chpasswd 
fi


exit 0



