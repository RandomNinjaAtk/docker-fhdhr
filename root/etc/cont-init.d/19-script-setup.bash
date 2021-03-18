#!/usr/bin/with-contenv bash

if [ ! -d /config ]; then 
	exit 1
else
	echo "Config volume exists"
fi

if [ ! -d /config/fHDHR ]; then 
	cd /config
	git clone https://github.com/fHDHR/fHDHR.git
else
	echo "fHDHR already installed"
fi

exit $?
