/usr/bin/systemctl stop clamav-freshclam && freshclam && /usr/bin/systemctl start clamav-freshclam;
apt-get update && apt-get upgrade -y 
