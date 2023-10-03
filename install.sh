#!/bin/bash

NC='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
GRAY='\033[1;30m'

if [ "$EUID" -ne 0 ]; then
    echo -e "${ORANGE}Please run as root${NC}"
    exit
fi

if [ -f "/usr/bin/cogit" ]; then
    echo -e "${RED}cogit is already installed${NC}"
    exit 1
else
    echo -e "${BLUE}Installing cogit...${NC}"
    sudo install -m 755 cogit /usr/bin/cogit
fi

if [ -f "/usr/bin/cogit" ]; then
    echo -e "${GREEN}cogit installed successfully${NC}"
else
    echo -e "${RED}cogit installation failed${NC}"
fi

if [ $(env | grep PATH | grep -c "/usr/bin") -eq 0 ]; then
    echo -e "${ORANGE}Please add /usr/bin to your PATH${NC}"
fi