#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  libfprint
  fprintd
)

pacman_install "${PACKAGES[@]}"
