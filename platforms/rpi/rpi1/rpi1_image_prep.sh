#! /bin/sh

# Is there a version of this for the Raspberry Pi 1?
# change govenor to performance
# echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# set the locales and time zone
dpkg-reconfigure locales
dpkg-reconfigure tzdata

# Make sure we are running the latest and greatest
apt-get update -y
apt-get dist-upgrade -y

# Add re-generate SSL keys <--------------------------------

# Install new kernel and matching headers
apt-get install linux-image-3.12-1-rpi -y
apt-get install linux-headers-3.12-1-rpi -y

# add to /boot/config.txt
# Change this to a patch
echo "kernel=vmlinuz-3.12-1-rpi" >>/boot/config.txt
echo "initramfs initrd.img-3.12-1-rpi followkernel" >>/boot/config.txt

Raspberry Pi will show the DHCP assigned address.
Recomended:
change from DHCP to static IP

At this point you can either continue on the USB console or
switch over to SSH login on your LAN.
easier since you can now copy and paste from this document to the SSH screen.

pistar login: pi
Password: Your_Secret_Password_From_Above

# set the root password
pi@pistar~$ sudo -s
root@pistar:/home/pi# passwd root
	Enter new UNIX password: Your_very_secret_password
	Retype new UNIX password: Your_very_secret_password

###########################################################
#
# Change this to a patch and run it before build_asterisk
# Only for the Raspberry Pi 1
# Change this to a patch

add PROC=arm to Makefile for GSM
cd /usr/src/astsrc-1.4.23-pre/asterisk
cp /srv/replaced/Makefile.gsm ./codecs/gsm/Makefile

#
#
###########################################################

#### Move this to get_src and comment out
#### add patch for makeopts

# this may be removed. Kept for now
# At least turn this into a patch
# install ilbc
cp /srv/replaced/get_ilbc_source.sh ./contrib/scripts/get_ilbc_source.sh


