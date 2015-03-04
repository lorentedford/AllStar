How to install AllStar Asterisk on a Raspberry Pi (PiStar)
This is not a script on it's own.
It is a howto that can be coped from.

Start with at leat 4GB card
Copy stock Raspbian image to SD card
I used the 12-24-2014 image

Boot Raspberry Pi on the SD card.
raspi-config will come up on the first time boot.
	1: Expand the file system to use the full SD card.
	2: Change the User Password to something you will remember.
	8: Advanced Options
		A2: Set the Hostname (pistar)
Finish raspi-config (reboot now)

Raspberry Pi will show the DHCP assigned address.
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

# make sure all new updates are applied
root@pistar:/home/pi# apt-get update
root@pistar:/home/pi# apt-get upgrade

# Set time zone
dpkg-reconfigure tzdata

# get scripts and patches
root@pistar:/home/pi# cd /srv/
root@pistar:/home/pi# wget http://dropbox.com/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
root@pistar:/home/pi# untar xxx_xxxxxxx.tgz


# Move to Raspberry Pi 1 image_setup script
# aptitude install linux-headers-3.12-1-rpi
# aptitude install linux-image-3.12-1-rpi


run /srv/scripts/install
run /srv/scripts/build_tools
run /srv/scripts/get_src
run /srv/scripts/os_changes

Recomended:
change from DHCP to static IP

###########################################################
#
# Change this to a patch and run it after get_src
# Only for the Raspberry Pi 1

add PROC=arm to Makefile for GSM
cd /usr/src/astsrc-1.4.23-pre/asterisk
cp /srv/replaced/Makefile.gsm ./codecs/gsm/Makefile

#
#
###########################################################

#### Move this to get_src and comment out
#### add patch for makeopts
install ilbc
cp /srv/replaced/get_ilbc_source.sh ./contrib/scripts/get_ilbc_source.sh
run contrib/scripts/get_ilbc_source.sh

Fix SSL for Wheezy (res_crypto)
patch configure and configure.in
cp /srv/patches/patch-configure .
cp /srv/patches/patch-configure.ac .
patch <patch-configure
patch <patch-configure.ac

Fix /etc/init.d/asterisk for Wheezy
sed -i 's/91 2 3 4 5/91 0 1 6/g' Makefile
cp /srv/replaced/rc.debian.asterisk ./contrib/init.d/rc.debian.asterisk

build and install asterisk

./configure
Make Menuselect
	add ilbc

make
make install
make config
make samples

cp allstar/rc.updatenodelist /usr/local/bin
add '/usr/local/bin/rc.updatenodelist &' to /etc/rc.local 

Update config files
cd /etc/asterisk
rm *
copy /srv/configs/* .

<http://www.raspberrypi.org/forums/viewtopic.php?f=56&t=4885&p=163382>
<http://www.raspberry-asterisk.org/first-compile/>
  



