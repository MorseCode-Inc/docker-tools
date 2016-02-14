#!/bin/bash

absdir() {

	if [ ! -d "$1" ]
	then
		echo "absdir: $1 must be a directory." >&2
		exit 1
	fi

	cd "$1" >/dev/null 2>&1
	pwd
	cd - >/dev/null 2>&1
}

DIR=$(absdir "${0%/*}")
TAG="${DIR##*/}"

if [ ! -f "$DIR/Dockerfile" ]
then
	echo "Missing required Dockerfile in $DIR"
	exit 1
fi

docker build -t "$TAG" "$DIR"

exit
