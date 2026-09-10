#!/bin/sh

# Disable dock
gnome-extensions disable ubuntu-dock@ubuntu.com

# Enbable hotkeys
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gsettings set org.gnome.settings-daemon.plugins.media-keys control-center "['<Super>i']"

# Remake hotkeys for input change
gsettings set org.gnome.desktop.input-sources xkb-options "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt>Shift_L', '<Shift>Alt_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L', '<Shift>Alt_L']"

# Change delay (500)
gsettings set org.gnome.desktop.peripherals.keyboard delay 180
# Change repeat interval (50)
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20

# Install hide top bar extension
sudo apt update
sudo apt install -y gnome-shell-extension-autohidetopbar

# Enable extension
gnome-extensions enable hidetopbar@mathieu.bidon.ca

# System color scheme
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# System assent color
gsettings set org.gnome.desktop.interface accent-color 'green'

# Hide all icons on home screen
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
gsettings set org.gnome.shell.extensions.desktop-icons show-volumes false

cd "$(dirname "$0")"

chmod +x scripts/inst_alacr.sh
chmod +x scripts/inst_tmux.sh

./scripts/inst_alacr.sh
./scripts/inst_tmux.sh

echo "Tip Top"
