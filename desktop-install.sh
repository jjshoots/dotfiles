#!/bin/bash

# install dependencies
echo "Installing dependencies..."
sudo apt install git node-typescript make gnome-tweaks gnome-shell-extensions

# install pop shell
echo "Installing Pop! shell..."
git clone https://github.com/pop-os/shell.git /tmp/shell
cd /tmp/shell
git fetch origin master_noble
git checkout master_noble
make local-install
cd -

# install tokyonight dark colorscheme
git clone https://github.com/jjshoots/tokyonight_dark.git /tmp/tokyonight_dark
mkdir -p ~/.themes
mv /tmp/tokyonight_dark ~/.themes/

echo "Install user themes from here: https://extensions.gnome.org/extension/19/user-themes/"
echo "Select 'tokyonight_dark theme' in shell extensions"
