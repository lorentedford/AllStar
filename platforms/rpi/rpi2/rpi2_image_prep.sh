#! /bin/sh
#########################################################
#                                                       #
# Image prepare script was built for rpi2 install.      #
#                                                       #
#########################################################

# change governor to performance
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# set the locales and time zone
dpkg-reconfigure locales
dpkg-reconfigure tzdata

echo "deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi" >>/etc/apt/sources.list
wget http://archive.raspbian.org/raspbian.public.key -O - | sudo apt-key add -

# Make sure we are running the latest and greatest
apt-get update -y
apt-get dist-upgrade -y

# Install and run rpi-ipdate
# apt-get install curl -y
# apt-get install sudo -y
# apt-get install binutils -y

# curl -L --output /usr/bin/rpi-update https://raw.githubusercontent.com/Hexxeh/rpi-update/master/rpi-update && chmod +x /usr/bin/rpi-update
# rpi-update

# Add re-generate SSL keys
rm /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server

echo "If you saw no errors above REBOOT now!"


