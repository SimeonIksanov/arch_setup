#!/usr/bin/env bash
set -euo pipefail

source shared.sh

PACKAGES=(
  waybar
  upower
)

STOW_ITEMS=(
  waybar
)

pacman_install "${PACKAGES[@]}"
stow_install "${STOW_ITEMS[@]}"
