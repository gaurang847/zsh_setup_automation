#!/bin/bash
set -e  # Exit on first failure

print_heading () {
  local colorize="\e[33m"
  local resetColorize="\e[0m"
  local title=$1

  echo ""
  echo -e $colorize$title$resetColorize
}

print_heading "Step 0: Preparation"
sudo apt update   # Update apt cache
sudo apt install -y git

print_heading "Step 1: Installing Font FiraCode"
sudo apt install -y fonts-firacode

print_heading "Step 2: Installing Nerd-Font patch for the FiraCode font"
if [[ ! -d /tmp/nerd-fonts ]]
then
  git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd-fonts
fi
cd /tmp/nerd-fonts
./install.sh FiraCode
