#!/usr/bin/env bash

source shared.sh

PACKAGES=(
  #package_name
)

YAY_PACKAGES=(
  #package_name
)

STOW_ITEMS=(
  waybar
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done

for pkg in "${YAY_PACKAGES[@]}"; do
  yay -S --noconfirm --cleanafter --answerclean "Y" --answerdiff "N" --needed "$pkg"
done

for item in "${STOW_ITEMS[@]}"; do
  stow --dotfiles -v -d ${HOME}/arch_setup/dotfiles -t ${HOME} "$item"
done
