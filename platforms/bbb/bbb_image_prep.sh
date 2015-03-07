#! /bin/sh

# change governor to performance for BBB?
# echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# set the locales and time zone
dpkg-reconfigure locales
dpkg-reconfigure tzdata

# Make sure we are running the latest and greatest
apt-get update -y
apt-get dist-upgrade -y

# Add re-generate SSL keys <--------------------------------

echo "If you saw no errors above REBOOT now!"


