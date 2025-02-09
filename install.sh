#!/usr/bin/env bash

set -e

# Ensure sudo.
if [[ $EUID -ne 0 ]]; then
    echo "This script requires sudo privileges to run. Please run using: \"sudo bash install.sh\"."
    exit 1
fi

OS_ID=$(grep -w "ID" /etc/os-release | cut -d= -f2 | tr -d '"')
if  [[ "$OS_ID" == "debian" ]]; then
    echo "Updating \"/etc/apt/sources.list\"..."
    sudo cat > "/etc/apt/sources.list" << EOF
deb http://deb.debian.org/debian testing main
deb http://deb.debian.org/debian testing-updates main
deb http://security.debian.org/debian-security testing-security main
deb http://ftp.debian.org/debian testing-backports main
EOF
fi

echo "Updating system packages..."
apt update -qq && sudo apt upgrade -y -qq

echo "Installing stow..."
apt install -y -qq stow

echo "Linking dotfiles using stow..."
USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
cd "$USER_HOME/.dotfiles/"
stow --adopt -t "$USER_HOME" core 
git reset --hard &> /dev/null

echo "Installing additional pacages..."
apt install -y -qq gcc neovim npm tmux unzip wget xdg-user-dirs zsh

echo "Setting up user directories..."
sudo -u "$SUDO_USER" xdg-user-dirs-update

echo "Done! please run zsh"
