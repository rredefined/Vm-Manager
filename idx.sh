#!/bin/bash

# Exit immediately if a command fails
set -e

echo "=== Running VPS setup ==="

# Step 1: Run remote setup script
echo "[1/3] Downloading and running remote VPS setup..."
bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/Vps/refs/heads/main/cd/root)

# Step 2: Prompt to set root password
echo "[2/3] Setting root password..."
sudo passwd root

# Step 3: Install Tailscale
echo "[3/3] Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo "=== Setup complete! ==="
