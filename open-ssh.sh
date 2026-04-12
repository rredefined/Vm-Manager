#!/bin/bash

# Exit immediately if any command fails
set -e

# Clear terminal
clear

# Update package list (optional but recommended)
apt update

# Install git
apt install git -y

# Clone the repository
git clone https://github.com/rredefined/NighT-ssh.git

# Move into the directory
cd NighT-ssh

# Make the script executable
chmod +x init-ssh.sh

# Clear terminal again before starting
clear

# Run the script
./init-ssh.sh
