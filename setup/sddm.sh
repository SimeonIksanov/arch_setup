#!/usr/bin/env bash

PACKAGES=(
  sddm
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done

sudo systemctl enable sddm.service
