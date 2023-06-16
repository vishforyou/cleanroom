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

python3 -m pip3 install numpy opencv-python pillow labelImg PyMuPDF tqdm
cr_dir=$(ls -1 /volumes/user/home| grep -v 'lost+found')
pth="/volumes/user/home/${cr_dir}"
cp convert_pdf_to_image.py /home/{pth}/bin
mkdir -p /home/{pth}/input_dir
chmod 777 /home/{pth}/input_dir
mkdir -p /home/{pth}/output_dir
chmod 777 /home/{pth}/output_dir
cp README_for_conversion.txt $pth



