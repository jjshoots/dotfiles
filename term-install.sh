#!/bin/bash

# first, upgrade everything
sudo apt update
sudo apt upgrade -y

# custom fonts
curl https://raw.githubusercontent.com/jjshoots/mononoki-monospaced/main/install.sh | bash -s

# install git
echo "Installing git..."
sudo apt install git

# clean our install directory
rm -rf ~/.config/kitty
rm -rf ~/.config/nvim
rm -rf ~/.config/tmux
rm -rf ~/.config/fish

# install all my dotfiles, this installs things using HTTPs so no ssh
echo "Cloning all dotfiles"
git clone git@github.com:jjshoots/kitty_dotfiles.git ~/.config/kitty
git clone git@github.com:jjshoots/nvim_dotfiles.git ~/.config/nvim
git clone git@github.com:jjshoots/tmux_dotfiles.git ~/.config/tmux
git clone git@github.com:jjshoots/fish_dotfiles.git ~/.config/fish

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

# conditionally set default terminal as fish
read -p "Set default terminal as fish? (y/n): " user_input
if [ "$user_input" = "y" ]; then
  chsh -s "$(which fish)"
fi

# conditionally generate ssh keys
read -p "Generate new ssh keys? (y/n): " user_input
if [ "$user_input" = "y" ]; then
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
else
  echo "Skipping ssh keygen..."
fi
