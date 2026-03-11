#!/bin/bash

echo "Updating system packages..."
sudo dnf update -y

echo "Installing dependencies..."
sudo dnf install -y curl zlib-devel openssl-devel xz-devel 
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh --disable-telemetry

echo "Setting Netdata to start on boot..."
sudo systemctl enable netdata

echo "Starting Netdata service..."
sudo systemctl start netdata

echo "Netdata installation completed. Access the dashboard at http://localhost:19999"
