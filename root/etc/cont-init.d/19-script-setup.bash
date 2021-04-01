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
	echo "Updating...."
	git -C /config/fHDHR reset --hard HEAD && \
    	git -C /config/fHDHR pull origin main
	pip3 install -r /config/fHDHR/requirements.txt
fi

if [ ! -f /config/config.ini ]; then
	echo "fHDHR Config does not exist, importing example"
	cp /config/fHDHR/config.example.ini /config/config.ini
else
	echo "fHDHR Config exists"
fi

echo "Checking for fHDHR plugin installs..."
if [ ! -z "$ORIGIN_PLUGINS" ]; then
	IFS=', ' read -r -a filters <<< "$ORIGIN_PLUGINS"
	for filter in "${filters[@]}"
	do
		if [ ! -d /config/fHDHR/plugins/fHDHR_plugin_origin_${filter} ]; then
			cd /config/fHDHR/plugins
			git clone https://github.com/fHDHR/fHDHR_plugin_origin_${filter}.git
			if [ -f "/config/fHDHR/plugins/fHDHR_plugin_origin_${filter}/requirements.txt" ]; then
				pip3 install -r "/config/fHDHR/plugins/fHDHR_plugin_origin_${filter}/requirements.txt"
			fi
			cd /config/
		else
			echo "Origin Plugin \"${filter}\" already installed..."
			echo "Updating...."
			git -C /config/fHDHR/plugins/fHDHR_plugin_origin_${filter} reset --hard HEAD && \
    			git -C /config/fHDHR/plugins/fHDHR_plugin_origin_${filter} pull origin main
			if [ -f "/config/fHDHR/plugins/fHDHR_plugin_origin_${filter}/requirements.txt" ]; then
				pip3 install -r "/config/fHDHR/plugins/fHDHR_plugin_origin_${filter}/requirements.txt"
			fi
		fi
	done
else
	echo "No origin plugins to install"
fi

if [ ! -z "$INTERFACE_PLUGINS" ]; then
	IFS=', ' read -r -a filters <<< "$INTERFACE_PLUGINS"
	for filter in "${filters[@]}"
	do
		if [ ! -d /config/fHDHR/plugins/fHDHR_plugin_interface_${filter} ]; then
			cd /config/fHDHR/plugins
			git clone https://github.com/fHDHR/fHDHR_plugin_interface_${filter}.git
			if [ -f "/config/fHDHR/plugins/fHDHR_plugin_interface_${filter}/requirements.txt" ]; then
				pip3 install -r "/config/fHDHR/plugins/fHDHR_plugin_interface_${filter}/requirements.txt"
			fi
			cd /config/
		else
			echo "Interface Plugin \"${filter}\" already installed..."
			echo "Updating...."
			git -C /config/fHDHR/plugins/fHDHR_plugin_interface_${filter} reset --hard HEAD && \
    			git -C /config/fHDHR/plugins/fHDHR_plugin_interface_${filter} pull origin main
			if [ -f "/config/fHDHR/plugins/fHDHR_plugin_interface_${filter}/requirements.txt" ]; then
				pip3 install -r "/config/fHDHR/plugins/fHDHR_plugin_interface_${filter}/requirements.txt"
			fi
		fi
	done
else
	echo "No Interface plugins to install"
fi

if [ ! -z "$STREAM_PLUGINS" ]; then
	IFS=', ' read -r -a filters <<< "$STREAM_PLUGINS"
	for filter in "${filters[@]}"
	do
		if [ ! -d /config/fHDHR/plugins/fHDHR_plugin_stream_${filter} ]; then
			cd /config/fHDHR/plugins
			git clone https://github.com/fHDHR/fHDHR_plugin_stream_${filter}.git
			if [ -f "/config/fHDHR/plugins/fHDHR_plugin_stream_${filter}/requirements.txt" ]; then
				pip3 install -r "/config/fHDHR/plugins/fHDHR_plugin_stream_${filter}/requirements.txt"
			fi
			cd /config/
		else
			echo "Stream Plugin \"${filter}\" already installed..."
			echo "Updating...."
			git -C /config/fHDHR/plugins/fHDHR_plugin_stream_${filter} reset --hard HEAD && \
    			git -C /config/fHDHR/plugins/fHDHR_plugin_stream_${filter} pull origin main
			if [ -f "/config/fHDHR/plugins/fHDHR_plugin_stream_${filter}/requirements.txt" ]; then
				pip3 install -r "/config/fHDHR/plugins/fHDHR_plugin_stream_${filter}/requirements.txt"
			fi
		fi
	done
else
	echo "No Stream plugins to install"
fi

if [ ! -z "$EPG_PLUGINS" ]; then
	IFS=', ' read -r -a filters <<< "$EPG_PLUGINS"
	for filter in "${filters[@]}"
	do
		if [ ! -d /config/fHDHR/plugins/fHDHR_plugin_epg_${filter} ]; then
			cd /config/fHDHR/plugins
			git clone https://github.com/fHDHR/fHDHR_plugin_epg_${filter}.git
			if [ -f "/config/fHDHR/plugins/fHDHR_plugin_epg_${filter}/requirements.txt" ]; then
				pip3 install -r "/config/fHDHR/plugins/fHDHR_plugin_epg_${filter}/requirements.txt"
			fi
			cd /config/
		else
			echo "EPG Plugin \"${filter}\" already installed..."
			echo "Updating...."
			git -C /config/fHDHR/plugins/fHDHR_plugin_epg_${filter} reset --hard HEAD && \
    			git -C /config/fHDHR/plugins/fHDHR_plugin_epg_${filter} pull origin main
			if [ -f "/config/fHDHR/plugins/fHDHR_plugin_epg_${filter}/requirements.txt" ]; then
				pip3 install -r "/config/fHDHR/plugins/fHDHR_plugin_epg_${filter}/requirements.txt"
			fi
		fi
	done
else
	echo "No EPG plugins to install"
fi

exit $?
