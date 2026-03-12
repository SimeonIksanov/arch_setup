#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  ghostty
  kitty
)

pacman_install "${PACKAGES[@]}"
stow_install "${PACKAGES[@]}"
