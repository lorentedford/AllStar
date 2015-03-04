#! /bin/sh

#########################################################
#                                                       #
# script was built for Linode AllStar Asterisk install. #
#                                                       #
#########################################################

/srv/scripts/required_libs.sh
/srv/scripts/build_tools.sh
/srv/scripts/get_src.sh

/srv/scripts/build_dahdi.sh
/srv/scripts/build_asterisk.sh

