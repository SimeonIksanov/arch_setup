#!/usr/bin/env bash

source shared.sh

PACKAGES=(
  zathura
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done


ITEMS=(
  zathura
)

for item in "${ITEMS[@]}"; do
  stow --dotfiles -v -d ${HOME}/arch_setup/dotfiles -t ${HOME} "$item"
done
