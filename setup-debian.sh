#!/bin/bash
set -e  # Exit on first failure

print_heading () {
  local colorize="\e[33m"
  local resetColorize="\e[0m"
  local title=$1

  echo ""
  echo -e $colorize$title$resetColorize
}

print_heading "Setting up ZSH. You may be required to input your password a few times. ^^'"

print_heading "Step 0: Necessary installations"
sudo apt update   # Update apt cache
sudo apt install -y git fonts-firacode zsh chroma

print_heading "Step 1: Installing Nerd-Font patch for the FiraCode font"
if [[ ! -d /tmp/nerd-fonts ]]   # we save some time if Nerd Fonts repo was cloned in a previous attempt
then
  git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd-fonts
fi
/tmp/nerd-fonts/install.sh FiraCode

print_heading "Step 2: Making ZSH the default shell"
chsh -s $(which zsh)

print_heading "Step 3: Installing Oh-My-Zsh"
if [[ ! -d $HOME/.oh-my-zsh ]]   # we save some time if OhMyZsh was cloned in a previous attempt
then
  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  print_heading "Oh-My-Zsh is already installed."
fi

print_heading "Step 4: Installing Powerlevel10k"
if [[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ]]   # we save some time if Powerlevel10k was cloned in a previous attempt
then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
else
  print_heading "Powerlevel10k is already installed"
fi

print_heading "Step 5: Configure custom files"
rsync -vh assets/.zshrc $HOME
rsync -vhr assets/custom/* $HOME/.oh-my-zsh/custom

print_heading "Setup complete! :D\nYou need to log out and log back in for changes to take effect."