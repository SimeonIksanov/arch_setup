#!/usr/bin/env bash

PACKAGES=(
  bitwarden
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done
