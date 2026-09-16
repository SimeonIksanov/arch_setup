#!/usr/bin/env bash

set -euo pipefail
source shared.sh

PACKAGES=(
  #package_name
)

YAY_PACKAGES=(
  noctalia
)

STOW_ITEMS=(
)

pacman_install "${PACKAGES[@]}"
stow_install "${STOW_ITEMS[@]}"
yay_install "${YAY_PACKAGES[@]}"
