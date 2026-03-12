#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  git
  lazygit
)

STOW_ITEMS=(
  git
)
pacman_install "${PACKAGES[@]}"
stow_install "${STOW_ITEMS[@]}"
