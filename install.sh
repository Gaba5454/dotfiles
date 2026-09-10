#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "================================"
echo "     Installing dotfiles"
echo "================================"

# Disable dock
gnome-extensions disable ubuntu-dock@ubuntu.com || true

# Enable hotkeys
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>i']"

# Input language hotkeys
gsettings set org.gnome.desktop.input-sources xkb-options "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt>Shift_L', '<Shift>Alt_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L', '<Shift>Alt_L']"

# Keyboard delay
gsettings set org.gnome.desktop.peripherals.keyboard delay 180

# Keyboard repeat interval
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20

# Install packages required by the setup
echo "Installing system packages..."
sudo apt update
sudo apt install -y git curl

# Install Hide Top Bar dependencies
# Enable extension
#gnome-extensions enable hidetopbar@mathieu.bidon.ca || true

# Dark theme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Accent color
gsettings set org.gnome.desktop.interface accent-color 'green'

# Hide desktop icons
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.shell.extensions.desktop-icons show-volumes false

# Make scripts executable
chmod +x "$DOTFILES_DIR/scripts/inst_alacr.sh"
chmod +x "$DOTFILES_DIR/scripts/inst_tmux.sh"

# Install Alacritty
echo ""
echo "================================"
echo "     Installing Alacritty"
echo "================================"
bash "$DOTFILES_DIR/scripts/inst_alacr.sh"

# Install tmux
echo ""
echo "================================"
echo "        Installing tmux"
echo "================================"
bash "$DOTFILES_DIR/scripts/inst_tmux.sh"

echo ""
echo "================================"
echo "       Installation complete"
echo "================================"
echo "Tip Top"
