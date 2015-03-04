#! /bin/sh

# Is there a version of this for the Raspberry Pi 1?
# change governor to performance
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
cd /boot
patch </srv/patches/patch-rpi1-config.txt

# Raspberry Pi will show the DHCP assigned address.
# Recomended:
# change from DHCP to static IP

# At this point you can either continue on the USB console or
# switch over to SSH login on your LAN.
# easier since you can now copy and paste from this document to the SSH screen.

# pistar login: pi
# Password: Your_Secret_Password_From_Above

# set the root password
sudo -s
passwd root
#	Enter new UNIX password: Your_very_secret_password
#	Retype new UNIX password: Your_very_secret_password

#### Move this to get_src and comment out
#### add patch for makeopts

# this may be removed. Kept for now
# At least turn this into a patch
# install ilbc
# cp /srv/replaced/get_ilbc_source.sh ./contrib/scripts/get_ilbc_source.sh


