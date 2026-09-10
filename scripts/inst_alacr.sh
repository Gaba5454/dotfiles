#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "Reinstall Alacritty"

# Remove old version
sudo apt purge -y alacritty || true
sudo apt autoremove -y

# Remove old config
rm -rf "$HOME/.config/alacritty"

# Install
sudo apt update
sudo apt install -y alacritty

# Create config directory
mkdir -p "$HOME/.config/alacritty"

# Copy config
cp "$DOTFILES_DIR/config/alacritty.toml" \
   "$HOME/.config/alacritty/alacritty.toml"

echo "Alacritty config done"
echo "Alacritty done"
