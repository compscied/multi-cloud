#!/bin/bash

APP_NAME="consul"
APP_DIR="/usr/local/bin"
SYSTEMD_DIR="/etc/systemd/system"

function usage {
	printf "Consul Installer\nUsage: $1 /path/to/consul.zip\n"
	echo "download consul from https://www.consul.io/downloads.html"
}

function installConsul {
	mkdir -p "$APP_DIR" || exit 1
	unzip  "$1" -d "$APP_DIR" || exit 1
}

function installService {
	mkdir -p "$SYSTEMD_DIR" || exit 1
	cp -f "${APP_NAME}.service" "$SYSTEMD_DIR" || exit 1
	systemctl enable "${APP_NAME}.service" || exit 1
}

## Begin processing script
if [ -z "$1" ]; then
	usage $0
	exit 1
fi
./systemdUninstaller.sh
echo "Installing..."
installConsul $1
installService
echo "Done installing!"
exit 0
