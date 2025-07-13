#!/usr/bin/env bash

source shared.sh

PACKAGES=(
  waybar
  upower
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done


ITEMS=(
  waybar
)

for item in "${ITEMS[@]}"; do
  stow --dotfiles -v -d ${HOME}/arch_setup/dotfiles -t ${HOME} "$item"
done
