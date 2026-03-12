#!/usr/bin/env bash
set -euo pipefail
source shared.sh

PACKAGES=(
  rofi
)

pacman_install "${PACKAGES[@]}"
stow_install "${PACKAGES[@]}"
