#!/usr/bin/env bash
set -euo pipefail

source shared.sh

PACKAGES=(
  btop
  tmux
  yazi
)

pacman_install "${PACKAGES[@]}"
stow_install "${PACKAGES[@]}"
