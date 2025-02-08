#!/usr/bin/env bash

set -e

# Ensure sudo.
if [[ $EUID -ne 0 ]]; then
    echo "This script requires sudo privileges to run."
    sudo -v
fi

echo "Updating \"/etc/apt/sources.list\"..."
sudo cat > "/etc/apt/sources.list" << EOF
deb http://deb.debian.org/debian testing main
deb http://deb.debian.org/debian testing-updates main
deb http://security.debian.org/debian-security testing-security main
deb http://ftp.debian.org/debian testing-backports main
EOF

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "Linking dotfiles using stow..."
cd ~/.dotfiles/
stow --adopt -t ~ core 
git reset --hard

echo "Installing pacages..."
sudo apt install -y neovim tmux xdg-user-dirs zsh

echo "Setting up user directories..."
xdg-user-dirs-update

echo "Done!

