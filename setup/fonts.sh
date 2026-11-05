#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

FONTS=(
  noto-fonts
  noto-fonts-emoji
  ttf-font-awesome
  otf-font-awesome
  ttf-jetbrains-mono-nerd
)

pacman_install "${FONTS[@]}"
