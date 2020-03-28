#!/bin/zsh
setopt extendedglob nomatch
ln -fs ~/.dotfiles/dotfiles/.config/** ~/.config/
ln -fs ~/.dotfiles/dotfiles/.local/bin/* ~/.local/bin/
ln -fs ~/.dotfiles/dotfiles/.*~*.config*~*.local* ~/
