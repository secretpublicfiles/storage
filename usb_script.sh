#!/bin/bash
echo "USB storage and connection wizard by Vivente"
echo "Be careful: It applies changes to your system files!"


sudo echo "dtoverlay=dwc2" >> /boot/config.txt
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=10AZEtoUlm_PrZOIUxxUMrnz0LBNDhkbr' -O cmdline.txt
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=19WCRsswr3Lr4PBNrNz2yoy7PZ5HfRu-y' -O rc.local
sudo cp cmdline.txt /boot
sudo rm cmdline.txt
sudo dd bs=1M if=/dev/zero of=/piusb.bin count=16384
sudo mkdosfs "/piusb.bin"
sudo mkdir /mnt/usb_share
sudo echo "/piusb.bin /mnt/usb_share vfat users,umask=000 0 2" >> /etc/fstab
sudo mount -a
sudo cp rc.local /etc
sudo rm rc.local
echo "Please reboot the system!"