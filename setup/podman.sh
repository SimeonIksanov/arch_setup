#!/usr/bin/env bash
set -euo pipefail
source shared.sh

PACKAGES=(
  podman
  podman-compose
)

pacman_install "${PACKAGES[@]}"
