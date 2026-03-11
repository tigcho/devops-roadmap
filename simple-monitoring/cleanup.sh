#!/bin/bash

echo "Stopping Netdata service..."
sudo systemctl stop netdata
sudo systemctl disable netdata

echo "Removing Netdata..."
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --uninstall

echo "Netdata removed from the system."
