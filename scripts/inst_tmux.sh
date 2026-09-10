#!/bin/bash

cd "$(dirname "$0")"

echo "Install tmux"

# Delete old version 
sudo apt purge -y tmux
sudo apt autoremove -y

# Delete old config
rm -rf ~/.tmux
rm -f ~/.tmux.conf

# Clean install
sudo apt update
sudo apt install -y tmux

if [ -f "../config/tmux.conf" ]; then
    cp "../config/tmux.conf" ~/.tmux.conf
    echo "Config done"
else
    echo "Error"
fi

echo "tmux done"
