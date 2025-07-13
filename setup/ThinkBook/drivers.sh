#!/usr/bin/env bash

PACKAGES=(
  sof-firmware # sound driver
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done
