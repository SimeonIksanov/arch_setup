#!/usr/bin/env bash

source shared.sh

PACKAGES=(
  brightnessctl
  hypridle
  hypridle
  hyprland
  hyprpaper
  hyprpolkitagent
  hyprsunset
  libnotify
  uwsm
  xdg-desktop-portal-hyprland
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done

systemctl --user enable --now hyprpolkitagent.service

ITEMS=(
  hyprland
  uwsm
  wayland
)

for item in "${ITEMS[@]}"; do
  stow --dotfiles -v -d ${HOME}/arch_setup/dotfiles -t ${HOME} "$item"
done
