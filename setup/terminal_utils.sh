#!/usr/bin/env bash
set -euo pipefail

source shared.sh

PACKAGES=(
  cifs-utils
  btop
  opencode
  tmux
  yazi
)
YAY_APPS=(
  herdr-bin
)
STOW_PACKAGES=(
  btop
  herdr
  tmux
  yazi
)

pacman_install "${PACKAGES[@]}"
yay_install "${YAY_APPS[@]}"
stow_install "${STOW_PACKAGES[@]}"
