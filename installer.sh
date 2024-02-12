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

  # List files in current directory
  ls

  # Prompt user to enter email and password
  read -p "Enter your Bitping email: " email
  read -s -p "Enter your Bitping password: " password
  echo

  # Login to Bitping
  echo "Logging in to Bitping..."
  ./bitpingd login

  # Install Bitping service
  echo "Installing Bitping service..."
  sudo ./bitpingd service install

  # Login to Bitping with email and password
  echo "Logging in to Bitping with email and password..."
  sudo ./bitpingd login --email "$email" --password "$password"
else
  echo "Error: Bitping not installed."
fi