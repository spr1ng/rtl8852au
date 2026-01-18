#!/bin/bash
# DKMS install script for rtl8852au version 1.15.0.1

set -e

echo "Installing rtl8852au version 1.15.0.1 via DKMS..."

# Remove old version if it exists and is installed
if dkms status | grep -q "rtl8852au/1.15.0.1.*installed"; then
    echo "Removing existing installation..."
    sudo dkms remove rtl8852au/1.15.0.1 --all
fi

# Remove if just added but not built
if dkms status | grep -q "rtl8852au/1.15.0.1: added"; then
    echo "Removing added (but not built) version..."
    sudo dkms remove rtl8852au/1.15.0.1 --all
fi

# Add the module source
echo "Adding module to DKMS..."
sudo dkms add .

# Install the module
echo "Installing module..."
sudo dkms install rtl8852au -v 1.15.0.1

echo "Installation complete!"
echo "Current DKMS status:"
dkms status | grep rtl8852au
