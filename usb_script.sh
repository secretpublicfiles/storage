#!/bin/bash
echo "USB storage and connection wizard by Vivente"
echo "Be careful: It applies changes to your system files!"


sudo echo "dtoverlay=dwc2" >> /boot/config.txt
wget 'https://raw.githubusercontent.com/secretpublicfiles/storage/main/cmdline.txt' -O cmdline.txt
wget 'https://raw.githubusercontent.com/secretpublicfiles/storage/main/rc.local' -O rc.local
sudo sed -i 's/rootwait/rootwait modules-load=dwc2/' /boot/cmdline.txt
# sudo dd bs=1M if=/dev/zero of=/piusb.bin count=10240
# sudo mkdosfs "/piusb.bin"
# sudo mkdir /mnt/usb_share
# sudo echo "/piusb.bin /mnt/usb_share vfat users,umask=000 0 2" >> /etc/fstab
# sudo mount -a
# sudo cp rc.local /etc
# sudo rm rc.local
echo "Please reboot the system!"
