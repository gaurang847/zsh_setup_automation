#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_heading () {
  local colorize="\e[33m"
  local resetColorize="\e[0m"
  local title="$1"

  echo ""
  echo -e "${colorize}${title}${resetColorize}"
}

print_heading "Setting up ZSH. You may be required to input your password a few times. ^^'"

print_heading "Step 0: Necessary installations"
sudo apt update   # Update apt cache
# Install dependencies:
# - git, zsh: core setup
# - curl, wget, rsync, tar: download and transfer tools
# - fontconfig: provides fc-cache and fc-list for font management
# - python3-pygments: provides pygmentize for the Oh-My-Zsh colorize plugin
sudo apt install -y git zsh curl wget rsync tar fontconfig python3-pygments

print_heading "Step 1: Installing FiraCode Nerd Font"
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"
if ! fc-list : family 2>/dev/null | grep -qi "FiraCode Nerd Font"; then
  TEMP_ARCHIVE="$(mktemp --suffix=.tar.xz)"
  curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.tar.xz -o "$TEMP_ARCHIVE"
  tar -xf "$TEMP_ARCHIVE" -C "$FONT_DIR"
  rm -f "$TEMP_ARCHIVE"
  fc-cache -fv "$FONT_DIR"
else
  echo "FiraCode Nerd Font is already installed."
fi

print_heading "Step 2: Making ZSH the default shell"
CURRENT_SHELL="$(getent passwd "$USER" | cut -d: -f7)"
ZSH_BIN="$(command -v zsh)"
if [[ "$CURRENT_SHELL" != "$ZSH_BIN" ]]; then
  chsh -s "$ZSH_BIN"
else
  echo "Zsh is already your default shell."
fi

print_heading "Step 3: Installing Oh-My-Zsh"
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  # Run unattended so Oh-My-Zsh does not spawn an interactive shell and block the remaining steps
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh-My-Zsh is already installed."
fi

print_heading "Step 4: Installing Powerlevel10k"
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [[ ! -d "$P10K_DIR" ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
  echo "Powerlevel10k is already installed."
fi

print_heading "Step 5: Configure custom files"
# Create a backup of existing ~/.zshrc if it exists
if [[ -f "$HOME/.zshrc" ]]; then
  BACKUP_FILE="$HOME/.zshrc.bak.$(date +%Y%m%d%H%M%S)"
  echo "Backing up existing ~/.zshrc to $BACKUP_FILE"
  cp "$HOME/.zshrc" "$BACKUP_FILE"
fi

rsync -vh "$SCRIPT_DIR/assets/.zshrc" "$HOME/.zshrc"
rsync -avh "$SCRIPT_DIR/assets/custom/" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/"

print_heading "Setup complete! :D\nYou need to log out and log back in for the default shell changes to take effect."
print_heading "Please note that you'll have to manually select 'FiraCode Nerd Font' in your terminal emulator and in VS Code (for editor and terminal) and enable ligatures in both places. Otherwise, you'll see replacement symbols for glyphs that your terminal doesn't understand."
