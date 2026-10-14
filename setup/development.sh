#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  rustup
)

# STOW_ITEMS=(
# )

pacman_install "${PACKAGES[@]}"
# stow_install "${STOW_ITEMS[@]}"
