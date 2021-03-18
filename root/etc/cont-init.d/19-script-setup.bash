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

if [ ! -f /config/config.ini ]; then
	echo "fHDHR Config does not exist, importing example"
	cp /config/fHDHR/config.example.ini /config/config.ini
else
	echo "fHDHR Config exists"
fi

echo "Starting fHDHR..."
python3 /config/fHDHR/main.py -c=/config/config.ini


exit $?
