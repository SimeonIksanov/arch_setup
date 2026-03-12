#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  pipewire
  pipewire-alsa
  pipewire-pulse
  #pipewire-jack
  playerctl
  wireplumber
  pavucontrol
  #wiremix
)

pacman_install "${PACKAGES[@]}"
