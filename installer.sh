#!/bin/zsh
setopt extendedglob nomatch
ln -s ~/.dotfiles/dotfiles/.config/** ~/.config/
ln -s ~/.dotfiles/dotfiles/.local/bin/* ~/.local/bin/
ln -s ~/.dotfiles/dotfiles/.*~*.config*~*.local* ~/