#!/bin/bash
# ============================================
# VPS Package Cleaner + Auto Fixer
# Author: NighT
# Description: Fixes apt issues & cleans system
# ============================================

# Must be root
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root (sudo bash vps-cleanfix.sh)"
  exit 1
fi

echo "==> Updating package lists..."
apt update -y

echo "==> Fixing broken dependencies..."
apt --fix-broken install -y

echo "==> Reconfiguring partially installed packages..."
dpkg --configure -a

echo "==> Cleaning unnecessary packages..."
apt autoremove -y
apt autoclean -y
apt clean -y

echo "==> Checking for held packages..."
apt-mark showhold || echo "No held packages found."

echo "==> Removing old logs & temp files..."
rm -rf /var/log/*.old /var/log/*.gz /tmp/* /var/tmp/*

echo "================================================"
echo "✅ System cleaned and packages repaired!"
echo "💡 Tip: Run this monthly to keep your VPS smooth."
echo "================================================"
