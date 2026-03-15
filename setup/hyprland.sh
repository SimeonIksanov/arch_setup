#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  brightnessctl
  hypridle
  hyprland
  hyprlock
  hyprpaper
  hyprpolkitagent
  hyprsunset
  libnotify
  uwsm
  xdg-desktop-portal-hyprland
)

STOW_ITEMS=(
  hyprland
  uwsm
  wayland
)

pacman_install "${PACKAGES[@]}"
stow_install "${STOW_ITEMS[@]}"
systemctl --user enable --now hyprpolkitagent.service
