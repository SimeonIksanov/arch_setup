#!/usr/bin/env bash

PACKAGES=(
  pipewire
  pipewire-alsa
  pipewire-pulse
  #pipewire-jack
  playerctl
  wireplumber
  pavucontrol
  #wiremix
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done
