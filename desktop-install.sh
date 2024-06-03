#!/bin/bash

# install dependencies
echo "Installing dependencies..."
sudo apt install git node-typescript make gnome-tweaks gnome-shell-extensions

# install pop shell
echo "Installing Pop! shell..."
mkdir -p ~/System
git clone https://github.com/pop-os/shell.git
cd shell
make local-install

# install tokyonight dark colorscheme
git clone https://github.com/jjshoots/tokyonight_dark.git

echo "Install user themes from here: https://extensions.gnome.org/extension/19/user-themes/"
echo "Select 'tokyonight_dark theme' in shell extensions"
