#! /bin/sh

#########################################################
#                                                       #
# script was built for rpi2 AllStar Asterisk install.   #
#                                                       #
#########################################################

# change governor to performance
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

/srv/scripts/required_libs.sh
/srv/scripts/build_tools.sh
/srv/scripts/get_src.sh

/srv/scripts/build_dahdi.sh
/srv/scripts/build_asterisk.sh

# add performance setting to rc.local for rpi2
cd /etc
patch < /srv/patches/patch-rpi2-rc.local

