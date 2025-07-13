#!/usr/bin/env bash

FONTS=(
  noto-fonts
  ttf-font-awesome
  otf-font-awesome
  ttf-jetbrains-mono-nerd
)

for pkg in "${FONTS[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done
