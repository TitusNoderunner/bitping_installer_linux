#!/bin/bash

# Update and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install Docker, Docker Compose, and Podman
sudo apt install docker.io docker-compose -y
sudo apt install podman-docker -y

# Install Bitping
curl https://bitping.com/install.sh | bash

# Check if bitpingd executable exists
if [ -x "$(command -v /root/.local/bin/bitpingd)" ]; then
  echo "Bitping installed successfully."

  # List files in current directory
  ls

  # Login to Bitping
  echo "Logging in to Bitping..."
  /root/.local/bin/bitpingd login

  # Install Bitping service
  echo "Installing Bitping service..."
  sudo /root/.local/bin/bitpingd service install

  # Login to Bitping with email and password
  echo "Logging in to Bitping with email and password..."
  sudo /root/.local/bin/bitpingd login --email "YOUR_BITPING_EMAIL" --password "YOUR_BITPING_PASSWORD"
else
  echo "Error: Bitping not installed."
fi