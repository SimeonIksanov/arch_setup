#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  tlp
  tlp-pd
)

pacman_install "${PACKAGES[@]}"

sudo systemctl enable --now tlp.service
