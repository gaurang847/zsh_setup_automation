#!/usr/bin/env bash
set -euo pipefail

print_heading () {
  local colorize="\e[33m"
  local resetColorize="\e[0m"
  local title="$1"

  echo ""
  echo -e "${colorize}${title}${resetColorize}"
}

print_heading "Reverting ZSH setup to previous defaults..."

# Step 1: Revert default shell to the previous shell
print_heading "Step 1: Reverting default shell"
PREV_SHELL_FILE="$HOME/.zsh_setup_prev_shell"
CURRENT_SHELL="$(getent passwd "$USER" | cut -d: -f7)"

if [[ -f "$PREV_SHELL_FILE" ]]; then
  ORIGINAL_SHELL="$(tr -d '[:space:]' < "$PREV_SHELL_FILE")"
  rm -f "$PREV_SHELL_FILE"

  if [[ -n "$ORIGINAL_SHELL" && "$ORIGINAL_SHELL" != "$CURRENT_SHELL" ]]; then
    if command -v "$ORIGINAL_SHELL" >/dev/null 2>&1 || grep -qx "$ORIGINAL_SHELL" /etc/shells 2>/dev/null; then
      echo "Reverting default shell from $CURRENT_SHELL to previous shell ($ORIGINAL_SHELL)..."
      chsh -s "$ORIGINAL_SHELL"
    else
      echo "Previous shell ($ORIGINAL_SHELL) was not found on this system. Keeping current shell ($CURRENT_SHELL)."
    fi
  else
    echo "Default shell was already $CURRENT_SHELL before running setup. No change needed."
  fi
else
  # If no previous shell record was found (e.g. ran setup before tracking or file was removed)
  echo "No previous shell record found ($PREV_SHELL_FILE)."
  if [[ "$CURRENT_SHELL" == *"zsh"* ]]; then
    if [[ -t 0 ]]; then
      DEFAULT_FALLBACK="$(command -v bash || echo "/bin/bash")"
      read -r -p "Your current shell is Zsh. What shell would you like to revert to? [Default: $DEFAULT_FALLBACK, or type 'keep']: " user_shell || true
      user_shell="${user_shell:-$DEFAULT_FALLBACK}"
      if [[ "$user_shell" != "keep" && "$user_shell" != "$CURRENT_SHELL" ]]; then
        echo "Changing default shell to $user_shell..."
        chsh -s "$user_shell"
      else
        echo "Keeping current shell ($CURRENT_SHELL)."
      fi
    else
      echo "Non-interactive session: keeping current shell ($CURRENT_SHELL)."
    fi
  else
    echo "Current shell is $CURRENT_SHELL (not Zsh). No change needed."
  fi
fi

# Step 2: Restore original ~/.zshrc from backup
print_heading "Step 2: Restoring original ~/.zshrc"
LATEST_BACKUP="$(ls -t "$HOME"/.zshrc.bak.* 2>/dev/null | head -n 1 || true)"
if [[ -n "$LATEST_BACKUP" && -f "$LATEST_BACKUP" ]]; then
  echo "Found backup at $LATEST_BACKUP. Restoring..."
  cp "$LATEST_BACKUP" "$HOME/.zshrc"
  echo "Restored ~/.zshrc successfully."
elif [[ -f "$HOME/.zshrc.pre-oh-my-zsh" ]]; then
  echo "Found Oh-My-Zsh pre-install backup. Restoring..."
  cp "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"
  echo "Restored ~/.zshrc successfully."
else
  if [[ -f "$HOME/.zshrc" ]]; then
    echo "No prior backup found. Removing setup ~/.zshrc..."
    rm -f "$HOME/.zshrc"
  else
    echo "No ~/.zshrc found; nothing to revert."
  fi
fi

# Step 3: Remove Oh-My-Zsh and Powerlevel10k
print_heading "Step 3: Removing Oh-My-Zsh and Powerlevel10k"
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  echo "Removing $HOME/.oh-my-zsh directory..."
  rm -rf "$HOME/.oh-my-zsh"
else
  echo "Oh-My-Zsh directory not found."
fi

# Clean up Powerlevel10k cache if present
if [[ -d "${XDG_CACHE_HOME:-$HOME/.cache}" ]]; then
  rm -rf "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-"* 2>/dev/null || true
fi

# Step 4: Remove installed FiraCode Nerd Font files from ~/.local/share/fonts
print_heading "Step 4: Cleaning up FiraCode Nerd Font"
FONT_DIR="$HOME/.local/share/fonts"
if [[ -d "$FONT_DIR" ]]; then
  REMOVED_FONTS=0
  for font_file in "$FONT_DIR"/FiraCode*NerdFont*.ttf "$FONT_DIR"/FiraCode*.ttf; do
    if [[ -f "$font_file" ]]; then
      rm -f "$font_file"
      REMOVED_FONTS=1
    fi
  done
  if [[ $REMOVED_FONTS -eq 1 ]]; then
    echo "Removed FiraCode font files. Refreshing font cache..."
    fc-cache -fv "$FONT_DIR" 2>/dev/null || true
  else
    echo "No FiraCode font files found in $FONT_DIR."
  fi
fi

# Step 5: Optional package removal
print_heading "Step 5: Optional package cleanup"
if [[ -t 0 ]]; then
  read -r -p "Would you like to uninstall zsh and python3-pygments via apt? [y/N] " response || true
  if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Removing packages..."
    sudo apt remove -y zsh python3-pygments && sudo apt autoremove -y
  else
    echo "Keeping installed packages."
  fi
else
  echo "To remove installed packages, you can manually run:"
  echo "  sudo apt remove -y zsh python3-pygments && sudo apt autoremove -y"
fi

print_heading "Undo complete! :D"
print_heading "Please log out and log back in for shell changes to take effect."
