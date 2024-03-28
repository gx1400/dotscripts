#!/bin/bash

# Perform apt update and apt upgrade with automatic 'yes' to prompts
echo "Running apt update..."
sudo apt update -y
echo "Running apt upgrade..."
sudo apt upgrade -y

# Install zsh, curl, wget, and git
echo "Installing zsh, curl, wget, and git..."
sudo apt install -y zsh curl wget git

# Drop out of superuser privileges
echo "Dropping out of superuser privileges..."
echo "Now continuing as $USER"
echo "Current user:"
whoami

# From here, the script will continue executing as the regular user

# Install Oh My Zsh from GitHub
echo "Installing Oh My Zsh..."
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Clone zsh-autosuggestions from GitHub
echo "Cloning zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Clone Powerlevel10k from GitHub
echo "Cloning Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Change default shell to zsh
echo "Changing default shell to zsh..."
chsh -s $(which zsh)

# Copy rc profiles
cp .p10k.zsh ~
cp .zshrc ~

source ~/.zshrc

echo "Script completed successfully."
