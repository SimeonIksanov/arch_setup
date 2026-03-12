#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  neovim
  fzf
  fd
  ripgrep
  jq
)

STOW_ITEMS=(
  neovim
)

pacman_install "${PACKAGES[@]}"
stow_install "${STOW_ITEMS[@]}"
