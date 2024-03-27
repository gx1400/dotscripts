#!/bin/bash

# Check if the script is being run with superuser privileges
if [ "$(id -u)" != "0" ]; then
    echo "This script requires superuser privileges to run."
    echo "Please enter your password to continue."
    # Prompt for password and run the script with sudo
    sudo "$0" "$@"
    exit $?
fi

# Perform apt update and apt upgrade with automatic 'yes' to prompts
echo "Running apt update..."
apt update -y
echo "Running apt upgrade..."
apt upgrade -y

# Install zsh, curl, wget, and git
echo "Installing zsh, curl, wget, and git..."
apt install -y zsh curl wget git

# Install Oh My Zsh from GitHub
echo "Installing Oh My Zsh..."
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone Powerlevel10k from GitHub
echo "Cloning Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Change default shell to zsh
echo "Changing default shell to zsh..."
chsh -s $(which zsh)

echo "Script completed successfully."
