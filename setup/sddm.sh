#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  sddm
)

pacman_install "${PACKAGES[@]}"

sudo systemctl enable sddm.service
