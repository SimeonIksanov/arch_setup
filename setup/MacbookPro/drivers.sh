#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

DRIVERS=(
  linux-headers
  broadcom-wl-dkms
  brightnessctl
)

pacman_install "${PACKAGES[@]}"
