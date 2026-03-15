#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  vivaldi
)
YAY_APPS=(
  brave-bin
)

pacman_install "${PACKAGES[@]}"
# yay_install "${YAY_APPS[@]}"
