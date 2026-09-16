#!/usr/bin/env bash
set -euo pipefail
source ../shared.sh

PACKAGES=(
  fprintd
  libfprint
  libpam-fprintd
)

pacman_install "${PACKAGES[@]}"
