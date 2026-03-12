#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  imv
  ristretto
)

pacman_install "${PACKAGES[@]}"
