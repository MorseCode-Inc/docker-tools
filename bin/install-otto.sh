#!/bin/bash

VER="0.2.0"

INST_DIR="$1"

if [ ! -d "$INST_DIR" ]
then
	INST_DIR="/tmp"
fi

if [ ! -w "$INST_DIR" ]
then
	echo "Install directory $INST_DIR is not writeable, use sudo?"
	exit 1
fi

cd "$INST_DIR"
wget -O "otto-${VER}.zip" "https://releases.hashicorp.com/otto/${VER}/otto_${VER}_linux_amd64.zip"
unzip "otto-${VER}.zip"
sudo mv otto /usr/bin

echo
echo "otto"
otto


exit
