#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  bitwarden
)

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done
