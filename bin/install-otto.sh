#!/bin/bash

OTTO_VER="0.2.0"
VAGRANT_VER="1.8.1_x86_64"

INST_DIR="$1"
USR_BIN="/usr/bin"

if [ ! -d "$INST_DIR" ]
then
	INST_DIR="/tmp"
fi

if [ ! -w "$INST_DIR" ]
then
	echo "Install directory $INST_DIR is not writeable, use sudo?"
	exit 1
fi

if [ ! -w "$USR_BIN" ]
then
	echo "Install directory $USR_BIN is not writeable, use sudo?"
	exit 1
fi

cd "$INST_DIR"
wget -O "otto-${OTTO_VER}.zip" "https://releases.hashicorp.com/otto/${OTTO_VER}/otto_${OTTO_VER}_linux_amd64.zip"
unzip "otto-${OTTO_VER}.zip"
mv otto "$USR_BIN"/

wget -O vagrant_${VAGRANT_VER}.deb https://releases.hashicorp.com/vagrant/1.8.1/vagrant_${VAGRANT_VER}.deb
dpkg -i vagrant_${VAGRANT_VER}.deb

echo
echo "otto"
otto

exit
