
# cd /srv
# run linode_image_prep.sh

# power down your image

# make the changes to your image:
# https://www.linode.com/docs/tools-reference/custom-kernels-distros/run-a-distributionsupplied-kernel-with-pvgrub#debi$
# follow 64-bit Debian

# powerup your image


# cd /srv
# run linode_asterisk_install.sh

# edit /etc/asterisk/iax.conf
#	change 1999 to your node number	

# edit /etc/asterisk/rpt.conf
#	change rxchannel = SimpleUSB/usb to rxchannel = dahdi/pseudo
#	change 1999 to your node number

# edit /etc/asterisk/extensions.conf
#	change 1999 to your node number

# reboot

