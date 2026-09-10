#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "Install tmux"

# Remove old version
sudo apt purge -y tmux || true
sudo apt autoremove -y

# Remove old config and plugins
rm -rf "$HOME/.tmux"
rm -f "$HOME/.tmux.conf"

# Install required packages
sudo apt update
sudo apt install -y tmux git

# Copy config
cp "$DOTFILES_DIR/config/tmux.conf" "$HOME/.tmux.conf"

# Install TPM
echo "Installing TPM..."

git clone https://github.com/tmux-plugins/tpm \
    "$HOME/.tmux/plugins/tpm"

# Install tmux plugins
echo "Installing tmux plugins..."

"$HOME/.tmux/plugins/tpm/bin/install_plugins"

echo "tmux plugins installed"
echo "tmux config done"
echo "tmux done"
