#!/bin/zsh
mkdir ~/.config
mkdir ~/.local
mkdir ~/.local/bin
mkdir ~/.local/share
setopt extendedglob nomatch
ln -fs $(pwd)/dotfiles/.config/** ~/.config/
ln -fs $(pwd)/dotfiles/.local/bin/* ~/.local/bin/
ln -fs $(pwd)/dotfiles/.local/share/* ~/.local/share/
ln -fs $(pwd)/dotfiles/.*~*.config*~*.local* ~/
