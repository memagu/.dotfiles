#!/usr/bin/env bash

set -e

# Ensure sudo.
if [[ $EUID -ne 0 ]]; then
    echo "This script requires sudo privileges to run."
    exit 1
fi

echo "Updating \"/etc/apt/sources.list\"..."
sudo cat > "/etc/apt/sources.list" << EOF
deb http://deb.debian.org/debian testing main
deb http://deb.debian.org/debian testing-updates main
deb http://security.debian.org/debian-security testing-security main
deb http://ftp.debian.org/debian testing-backports main
EOF

echo "Updating system packages..."
apt update &> /dev/null && sudo apt upgrade -y &> /dev/null

echo "Installing stow..."
apt install -y stow &> /dev/null

echo "Linking dotfiles using stow..."
USER_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
cd "$USER_HOME/.dotfiles/"
stow --adopt -t "$USER_HOME" core 
git reset --hard &> /dev/null

echo "Installing additional pacages..."
apt install -y neovim tmux xdg-user-dirs zsh > /dev/null

echo "Setting up user directories..."
xdg-user-dirs-update

echo "Done!"
