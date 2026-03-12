#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  telegram-desktop
)

pacman_install "${PACKAGES[@]}"
