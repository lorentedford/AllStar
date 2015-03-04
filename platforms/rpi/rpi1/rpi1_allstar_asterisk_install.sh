#! /bin/sh

#########################################################
#                                                       #
# script was built for rpi2 AllStar Asterisk install.   #
#                                                       #
#########################################################

/srv/scripts/required_libs.sh
/srv/scripts/build_tools.sh
/srv/scripts/get_src.sh

/srv/scripts/build_dahdi.sh

# add fix for GSM codec for rpi1
cd /usr/src/astsrc-1.4.23-pre/asterisk/codecs/gsm
patch </srv/patches/patch-rpi1-gsm-makefile

/srv/scripts/build_asterisk.sh


