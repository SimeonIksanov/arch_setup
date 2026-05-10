#!/usr/bin/env bash
set -euo pipefail

source shared.sh

PACKAGES=(
  cifs-utils
  btop
  tmux
  yazi
)
STOW_PACKAGES=(
  btop
  tmux
  yazi
)

pacman_install "${PACKAGES[@]}"
stow_install "${STOW_PACKAGES[@]}"
