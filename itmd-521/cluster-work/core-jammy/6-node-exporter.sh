#!/bin/bash 
set -e
set -v

echo "Downloading Prometheus Node Exporter..."
wget http://10.0.0.40/node_exporter/node_exporter-1.4.0.linux-amd64.tar.gz
tar -xvzf node_exporter-1.4.0.linux-amd64.tar.gz

echo "Create system account and group node_exporter..."
sudo adduser --system --group node_exporter

echo "Copying extracted node_exporter to /usr/local/bin/..."
cp -v ./node_exporter-1.4.0.linux-amd64/node_exporter /usr/local/bin/node_exporter

echo "Changing ownership of node_exporter binary..."
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

sudo cp -v ../jammy-services/node-exporter.service /etc/systemd/system/node-exporter.service
