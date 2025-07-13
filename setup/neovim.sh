#!/usr/bin/env bash

source shared.sh

PACKAGES=(
  neovim
  fzf
  fd
  ripgrep
  jq
)

STOW_ITEMS=(
  neovim
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done

for item in "${STOW_ITEMS[@]}"; do
  stow --dotfiles -v -d ${HOME}/arch_setup/dotfiles -t ${HOME} "$item"
done
