#!/bin/bash
# ===============================================
#      ⚡ Fastfetch Installer for Ubuntu/Debian ⚡
# -----------------------------------------------
# Author  : NighT
# Discord : Nightt.js
# Credits : GPT-5 & NighT
# ===============================================

set -e

# ----- Colors -----
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
CYAN="\033[1;36m"
PURPLE="\033[1;35m"
NC="\033[0m"

# ----- Spinner Animation -----
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

# ----- Banner -----
clear
echo -e "${PURPLE}╔═══════════════════════════════════════════════════╗"
echo -e "║            ⚡ FASTFETCH INSTALLER SCRIPT ⚡         ║"
echo -e "╠═══════════════════════════════════════════════════╣"
echo -e "║  Author : ${CYAN}NighT${NC}"
echo -e "║  Discord: ${CYAN}Nightt.js${NC}"
echo -e "╚═══════════════════════════════════════════════════╝"
echo

# ----- Menu -----
echo -e "${YELLOW}Select your operating system:${NC}"
echo "1) Ubuntu"
echo "2) Debian"
echo "3) Exit"
echo
read -p "Enter your choice [1-3]: " choice

# ----- Installation Logic -----
case $choice in
    1)
        echo -e "\n${CYAN}Updating package list for Ubuntu...${NC}"
        sudo apt update -y > /dev/null 2>&1 &
        spinner
        echo -e "\n${YELLOW}Installing Fastfetch...${NC}"
        sudo apt install -y fastfetch > /dev/null 2>&1 &
        spinner
        echo -e "\n${GREEN}✅ Fastfetch installed successfully on Ubuntu!${NC}"
        ;;
    2)
        echo -e "\n${CYAN}Updating package list for Debian...${NC}"
        sudo apt update -y > /dev/null 2>&1 &
        spinner
        echo -e "\n${YELLOW}Checking repository for Fastfetch...${NC}"
        if apt-cache show fastfetch > /dev/null 2>&1; then
            sudo apt install -y fastfetch > /dev/null 2>&1 &
            spinner
        else
            echo -e "${YELLOW}Not found in repo. Downloading latest .deb...${NC}"
            wget -q https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.deb -O /tmp/fastfetch.deb &
            spinner
            sudo apt install -y /tmp/fastfetch.deb > /dev/null 2>&1 &
            spinner
            rm /tmp/fastfetch.deb
        fi
        echo -e "\n${GREEN}✅ Fastfetch installed successfully on Debian!${NC}"
        ;;
    3)
        echo -e "${RED}❌ Installation canceled. Goodbye!${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid choice. Please run the script again.${NC}"
        exit 1
        ;;
esac

# ----- Finish -----
echo
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🎉 Fastfetch is ready!${NC}"
echo -e "Run it by typing: ${YELLOW}fastfetch${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${PURPLE}Made with ❤️  by NighT (${CYAN}Nightt.js${PURPLE})${NC}"
