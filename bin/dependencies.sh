#!/bin/bash

OTTO_VER="0.2.0"
VAGRANT_VER="1.8.1_x86_64"

sudo apte installinux-headers-$(uname -r)
sudo apt install virtualbox
sudo dpkg-reconfigure virtualbox-dkms


exit

