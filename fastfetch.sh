#!/bin/bash

# fastfetch_installer.sh
# A simple script to install and run Fastfetch
# Made by NighT

# Function to display status messages
function status() {
    echo -e "\n\033[1;32m[*]\033[0m $1"
}

clear
echo "=============================================="
echo "         Fastfetch Installer Script"
echo "               Made by NighT"
echo "=============================================="

status "Adding Fastfetch PPA..."
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch

status "Updating package list..."
sudo apt update -y

status "Installing Fastfetch..."
sudo apt install -y fastfetch

status "Cleaning up..."
clear

status "Starting Fastfetch..."
fastfetch

echo -e "\n\033[1;34m[✔] Installation complete!\033[0m"
echo "Fastfetch successfully installed and running."
echo "----------------------------------------------"
echo "Credits: Script made by NighT 💀"
echo "----------------------------------------------"
