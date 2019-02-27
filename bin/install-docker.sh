#!/bin/bash

WHO="$(id -u)"
SUDO=""

if [ "$WHO" != 0 ]
then
  SUDO="sudo"
fi

#OS_RELEASE_INFO="/etc/os-release"
OS_RELEASE_INFO="/etc/lsb-release"

if [ -f "$OS_RELEASE_INFO" ]
then
  source "$OS_RELEASE_INFO"
else
  echo "Unable to determine distribution release (fnf: $OS_RELEASE_INFO)" >&2
  exit
fi

if [ -z "$DISTRIB_CODENAME" ]
then
  echo "Unable to determine distribution release (var missing: DISTRIB_CODENAME)" >&2
  exit
fi

{
case "$DISTRIB_CODENAME" in
trusty)
  echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main"
  ;;
wily)
  echo "deb https://apt.dockerproject.org/repo ubuntu-wily main"
  ;;
*)
  echo "deb https://apt.dockerproject.org/repo ubuntu-$DISTRIB_CODENAME main"
  ;;
esac
} >/tmp/docker.list

$SUDO mv /tmp/docker.list /etc/apt/sources.list.d/docker.list

$SUDO apt-get update
$SUDO apt-get install "linux-image-extra-$(uname -r)"
$SUDO apt-get install apparmor
$SUDO apt-get install "linux-image-generic-lts-$DISTRIB_CODENAME"
$SUDO apt-get install docker-engine

exit
