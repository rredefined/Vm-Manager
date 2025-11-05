#!/bin/bash
# ===============================================
# ⚡ Fastfetch Installer (Ubuntu/Debian)
# -----------------------------------------------
# Author  : NighT
# Discord : Nightt.js
# Credits : GPT-5 & NighT
# ===============================================

set -e

# Colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
CYAN="\033[1;36m"
PURPLE="\033[1;35m"
NC="\033[0m"

spinner() {
    local pid=$!
    local delay=0.15
    local spin='|/-\'
    while ps -p $pid > /dev/null 2>&1; do
        for i in $(seq 0 3); do
            echo -ne "\r${CYAN}Installing... ${spin:$i:1}${NC}"
            sleep $delay
        done
    done
    echo -ne "\r${GREEN}✔ Done!${NC}                      \n"
}

clear
echo -e "${PURPLE}╔════════════════════════════════════════════╗"
echo -e "║          ⚡ FASTFETCH INSTALLER ⚡           ║"
echo -e "╠════════════════════════════════════════════╣"
echo -e "║  Author : ${CYAN}NighT${NC}"
echo -e "║  Discord: ${CYAN}Nightt.js${NC}"
echo -e "╚════════════════════════════════════════════╝"
echo

# Detect OS automatically if possible
if grep -qi "ubuntu" /etc/os-release; then
    choice=1
elif grep -qi "debian" /etc/os-release; then
    choice=2
else
    echo -e "${RED}⚠ Unsupported OS. Please use Ubuntu or Debian.${NC}"
    exit 1
fi

echo -e "${CYAN}Detected OS:${NC} $(lsb_release -ds 2>/dev/null || grep PRETTY_NAME /etc/os-release | cut -d= -f2)"
echo

# Install logic
case $choice in
    1)
        echo -e "${YELLOW}Installing Fastfetch for Ubuntu...${NC}"
        sudo apt update -y > /dev/null 2>&1 &
        spinner
        if ! sudo apt install -y fastfetch > /dev/null 2>&1; then
            echo -e "${YELLOW}Apt install failed, downloading latest .deb...${NC}"
            wget -q https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb -O /tmp/fastfetch.deb
            sudo apt install -y /tmp/fastfetch.deb > /dev/null 2>&1
            rm /tmp/fastfetch.deb
        fi
        ;;
    2)
        echo -e "${YELLOW}Installing Fastfetch for Debian...${NC}"
        sudo apt update -y > /dev/null 2>&1 &
        spinner
        if ! apt-cache show fastfetch > /dev/null 2>&1; then
            echo -e "${YELLOW}Not found in repo, downloading latest .deb...${NC}"
            wget -q https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb -O /tmp/fastfetch.deb
            sudo apt install -y /tmp/fastfetch.deb > /dev/null 2>&1
            rm /tmp/fastfetch.deb
        else
            sudo apt install -y fastfetch > /dev/null 2>&1 &
            spinner
        fi
        ;;
esac

# Verify installation
echo
echo -e "${CYAN}Verifying installation...${NC}"
if command -v fastfetch >/dev/null 2>&1; then
    echo -e "${GREEN}✅ Fastfetch installed successfully!${NC}"
    echo -e "${YELLOW}Run it with:${NC} fastfetch"
else
    echo -e "${RED}❌ Fastfetch command not found.${NC}"
    echo -e "${YELLOW}Trying to link manually...${NC}"
    if [ -f /usr/local/bin/fastfetch ]; then
        sudo ln -sf /usr/local/bin/fastfetch /usr/bin/fastfetch
    elif [ -f /usr/bin/fastfetch ]; then
        echo -e "${GREEN}Found in /usr/bin.${NC}"
    else
        echo -e "${RED}Installation may have failed.${NC}"
        echo -e "${YELLOW}Try reinstalling manually:${NC}"
        echo "wget https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb -O fastfetch.deb"
        echo "sudo apt install -y ./fastfetch.deb"
    fi
fi

echo
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🎉 Installation process completed.${NC}"
echo -e "${PURPLE}Made with ❤️  by NighT (${CYAN}Nightt.js${PURPLE})${NC}"
