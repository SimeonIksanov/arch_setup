#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  swaync
)

pacman_install "${PACKAGES[@]}"
stow_install "${PACKAGES[@]}"
