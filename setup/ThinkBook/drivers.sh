#!/usr/bin/env bash

set -euo pipefail
source ../shared.sh

PACKAGES=(
  intel-lpmd
  sof-firmware # sound driver
)

pacman_install "${PACKAGES[@]}"
