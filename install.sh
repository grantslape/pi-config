#!/bin/bash
USER_EMAIL="me@grantslape.com"
USER_NAME="Grant Slape"

# Run script with sudo
# Upgrade
echo "upgrate & upgrade..."
sudo apt-get update && sudo apt-get upgrade -y

# Install basics
echo "install basic pre-requisites..."
sudo apt-get install zsh git docker docker-compose vim -y

# Finish Docker install
echo "adding user to docker usergroup..."
sudo usermod -aG docker $USER

# Configure git
echo "Configuring git"
git config --global user.email $USER_EMAIL
git config --global user.name $USER_NAME

# Remove oh-my-zsh if exists
if [ -d "~/.oh-my-zsh" ]; then rm -rf "~/.oh-my-zsh"; fi

# Install Oh-my-zsh in script mode
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# cp over .zshrc
echo "Linking .zshrc..."
ln -s zshrc $HOME/.zshrc

# ZSH plugins
echo "Installing ZSH plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install P10K
echo "Install p10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# cp p10k.zsh
echo "Linking p10k config..."
ln -s p10k.zsh $HOME/.p10k.zsh

# cp vimrc
echo "Linking .vimrc..."
ln -s vimrc $HOME/.vimrc

# re init zsh
env zsh
