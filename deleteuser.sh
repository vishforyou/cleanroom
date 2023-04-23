#!/bin/bash

hname=$(hostname)
grep cleanroom /etc/passwd| cut -d ":" -f1| while read line
do
userdel -rf $line
done
echo "user/s deleted"


##
# Check if user got deleted
# then create a new user
grep ^cleanroom /etc/passwd
retval=$(echo $?)
if [ $retval -eq 1 ];then
useradd -d /home/${hname} -m ${hname}
echo "${hname}:${hname}@arw" | chpasswd
fi

