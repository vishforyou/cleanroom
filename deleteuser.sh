#!/bin/bash


grep cleanroom /etc/passwd| cut -d ":" -f1| while read line
do
userdel -rf $line
done

echo "user/s deleted"
