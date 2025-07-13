#!/usr/bin/env bash

PACKAGES=(
  imv
  ristretto
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done
