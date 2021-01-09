#!/bin/bash

# Run script with sudo
# Upgrade
sudo apt-get update && sudo apt-get upgrade -y

# Install basics
sudo apt-get install zsh git docker docker-compose vim -y

# Set shell to zsh
chsh -s /bin/zsh

# Install Oh-my-zsh in script mode
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# cp over .zshrc
cp zshrc ~/.zshrc

# Install P10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# cp p10k.zsh
cp p10k.zsh ~/.p10k.zsh

# cp vimrc
cp vimrc ~/.vimrc
