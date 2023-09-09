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
yum install xcb-util* -y
#yum install google-chrome --nogpgcheck -y
pip3 install --upgrade setuptools
pip3 install --upgrade pip
python3 -m pip install numpy opencv-python pillow labelImg PyMuPDF tqdm
cr_dir=$(ls -1 /volumes/user/home| grep -v 'lost+found')
pth="/volumes/user/home/${cr_dir}"
cp postfix_main.cf /etc/postfix/main.cf
sed -i "s/^myhostname.*/myhostname = $cr_dir-workspaces/" /etc/postfix/main.cf
cp convert_pdf_to_image.py /home/${cr_dir}
cp convert_pdf_to_image.py /home/${cr_dir}/bin
mkdir -p /home/${cr_dir}/source
chmod 777 /home/${cr_dir}/source
mkdir -p /home/${cr_dir}/target
chmod 777 /home/${cr_dir}/target
cp README_for_conversion.txt /home/${cr_dir}
cp classes.txt /home/${cr_dir}




