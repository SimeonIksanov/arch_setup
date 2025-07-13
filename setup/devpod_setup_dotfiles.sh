#!/usr/bin/env bash

#copy usefull configs and delete all the rest files
cp -R ~/dotfiles/dotfiles/neovim/dot-config/nvim ~/.config/nvim

cp -R ~/dotfiles/dotfiles/zsh/dot-zshrc ~/.zshrc

cp -R ~/dotfiles/dotfiles/tmux/dot-config/tmux ~/.config/tmux

rm -Rf ~/dotfiles
