#!/bin/bash

cd "$(dirname "$0")"

echo "Reinstall Alacritty"

# Delete old version
sudo apt purge -y alacritty
sudo apt autoremove -y

# Delete old config
rm -rf ~/.config/alacritty

# Clean install
sudo apt update
sudo apt install -y alacritty

if [ -f "../config/alacritty.toml" ]; then
    cp "../config/alacritty.toml" ~/.config/alacritty/alacritty.toml
    echo "Config done"
else
    echo "Error"
fi
echo "Alacritty done"
