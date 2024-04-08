#!/bin/bash

# sshkey for git
echo "Performing ssh keygen using ed25519 for git..."
ssh-keygen -t ed25519 -C $hostname -f /.ssh/ed_25519 -q -N ""

# print out the ssh public key to be added to git manually
echo "--------------------------------------------"
cat ~/.ssh/ed_25519.pub
echo "--------------------------------------------"
echo "Please add the above ssh key to https://github.com/settings/ssh/new"
echo "Press ENTER when done..."
read -l _

# install git
echo "Installing git..."
sudo apt install git

# install all my dotfiles, this installs things using HTTPs so no ssh
echo "Cloning all dotfiles"
cd ~/.config/
git clone git@github.com:jjshoots/kitty_dotfiles.git kitty
git clone git@github.com:jjshoots/nvim_dotfiles.git nvim
git clone git@github.com:jjshoots/tmux_dotfiles.git tmux
git clone git@github.com:jjshoots/fish_dotfiles.git fish

# install everything
echo "Installing dotfiles..."
cd ~/.config/kitty
./install.sh
cd ~/.config/nvim
./install.sh
cd ~/.config/tmux
./install.sh
cd ~/.config/fish
./install.sh