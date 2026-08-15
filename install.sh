#!/bin/sh

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/tmux

[ -f config/alacritty/alacritty.toml ] && cp config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
[ -f config/tmux/tmux.conf ] && cp config/tmux/tmux.conf ~/.config/tmux/tmux.conf
[ -f .tmux.conf ] && cp .tmux.conf ~/.tmux.conf
