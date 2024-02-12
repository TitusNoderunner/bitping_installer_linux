#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install Docker, Docker Compose, and Podman
sudo apt install docker.io docker-compose -y
sudo apt install podman-docker -y

# Install Bitping
curl https://bitping.com/install.sh | bash

# Check if bitpingd executable exists
if [ -x "$(command -v bitpingd)" ]; then
  echo "Bitping installed successfully."

# Login to Bitping
echo "Logging in to Bitping..."
$target_dir/bitpingd login

# Start Bitping service
echo "Starting Bitping service..."
sudo systemctl start bitpingd.service

  # Start Bitping service
  echo "Starting Bitping service..."
  sudo systemctl start bitpingd

# Enable Bitping service to start on boot
echo "Enabling Bitping service to start on boot..."
sudo systemctl enable bitpingd.service

  # Login to Bitping with email and password
  echo "Logging in to Bitping with email and password..."
  sudo bitpingd login --email "YOUR_BITPING_EMAIL" --password "YOUR_BITPING_PASSWORD"
else
  echo "Error: Bitping not installed."
fi