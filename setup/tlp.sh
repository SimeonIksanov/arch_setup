#!/usr/bin/env bash

PACKAGES=(
  tlp
  tlp-pd
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done


sudo systemctl enable --now tlp.service
