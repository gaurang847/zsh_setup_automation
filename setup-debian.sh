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

print_heading "Step 1: Installing Font FiraCode"
sudo apt install -y fonts-firacode
