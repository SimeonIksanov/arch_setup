#!/usr/bin/env bash

source shared.sh

PACKAGES=(
  rofi
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done


ITEMS=(
  rofi
)

for item in "${ITEMS[@]}"; do
  stow --dotfiles -v -d ${HOME}/arch_setup/dotfiles -t ${HOME} "$item"
done
