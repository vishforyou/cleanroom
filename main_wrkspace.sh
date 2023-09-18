#!/bin/bash
## copy files
cp hosts /etc/
cp deletedir.sh /root
cp run-before-shutdown-wrkspaces.service /etc/systemd/system/
cp hostcron_wrkspace /etc/cron.d/hostcron_wrkspace
# Setup for delete and creation
chmod +x /root/deletedir.sh
systemctl daemon-reload
systemctl enable run-before-shutdown-wrkspaces.service
#curl https://intoli.com/install-google-chrome.sh | bash
yum install xcb-util* -y
#yum install google-chrome --nogpgcheck -y
amazon-linux-extras install epel -y
yum install -y chromium
pip3 install --upgrade setuptools
pip3 install --upgrade pip
python3 -m pip install numpy opencv-python pillow labelImg PyMuPDF tqdm
yum install yum-cron -y
cr_dir=$(ls -1 /volumes/user/home| grep -v 'lost+found')
pth="/volumes/user/home/${cr_dir}"
cp postfix_main.cf /etc/postfix/main.cf
sed -i "s/^myhostname.*/myhostname = $cr_dir-workspaces/" /etc/postfix/main.cf
sed -i "s/\@localhost/\@${cr_dir}-workspaces/" /etc/yum/yum-cron-hourly.conf
systemctl enable yum-cron.service
systemctl start yum-cron.service
systemctl status yum-cron.service
cp convert_pdf_to_image.py /home/${cr_dir}
cp convert_pdf_to_image.py /home/${cr_dir}/bin
mkdir -p /home/${cr_dir}/source
chmod 777 /home/${cr_dir}/source
mkdir -p /home/${cr_dir}/target
chmod 777 /home/${cr_dir}/target
cp README_for_conversion.txt /home/${cr_dir}
cp classes.txt /home/${cr_dir}




