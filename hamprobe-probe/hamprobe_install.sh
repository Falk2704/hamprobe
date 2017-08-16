#!/bin/sh

if [ ! "$EUID" -eq "0" ]; then
	echo "This script must be run as root."
	exit 1;
fi

wget -O "/usr/local/bin/hamprobe_master.py" "http://api.hamprobe.net/assets/hamprobe_master.py"
chmod 744 "/usr/local/bin/hamprobe_master.py"

wget -O "/etc/hamprobe.conf" "http://api.hamprobe.net/assets/hamprobe.conf"
chmod 600 "/etc/hamprobe.conf"

wget -O "/etc/systemd/system/hamprobe.service" "http://api.hamprobe.net/assets/hamprobe.service"

systemctl daemon-reload
systemctl enable hamprobe
systemctl start hamprobe