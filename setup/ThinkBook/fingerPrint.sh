#!/usr/bin/env bash

PACKAGES=(
  libfprint
  fprintd
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done
