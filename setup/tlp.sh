#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  tlp
  tlp-pd
  # tlp-rdw
  powertop
)

pacman_install "${PACKAGES[@]}"

sudo systemctl enable --now tlp.service
sudo systemctl enable --now tlp-pd.service
