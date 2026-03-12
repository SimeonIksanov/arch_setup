#!/usr/bin/env bash
set -euo pipefail

source shared.sh

PACKAGES=(
  zathura
)

pacman_install "${PACKAGES[@]}"
stow_install "${PACKAGES[@]}"
