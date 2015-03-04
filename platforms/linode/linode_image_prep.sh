# Setup to install kernel and kernel headers
apt-get update
apt-get upgrade -y
apt-get install linux-image-amd64 -y
apt-get install patch -y

mkdir /boot/grub
apt-get install grub-legacy -y
grub-set-default 1
update-grub
cd /boot/grub

patch </srv/patches/patch-menu.lst
update-grub

# make the changes to you image:
# https://www.linode.com/docs/tools-reference/custom-kernels-distros/run-a-distributionsupplied-kernel-with-pvgrub#debian-7-wheezy
# follow 64-bit Debian

# Get scripts and patches

