#!/usr/bin/env bash

PACKAGES=(
  telegram-desktop
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done
