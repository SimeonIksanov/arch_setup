#!/usr/bin/env bash
set -euo pipefail

source shared.sh

YAY_PACKAGES=(
  wlogout
)

STOW_ITEMS=(
  wlogout
)

yay_install "${YAY_PACKAGES[@]}"
stow_install "${STOW_ITEMS[@]}"
