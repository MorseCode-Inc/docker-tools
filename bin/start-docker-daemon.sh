#!/bin/bash

DAEMON="-d"

if [ -z $(echo "$@") ]
then
	set -- /bin/bash
fi

docker run -t $DAEMON ubuntu "$@"


#exit
