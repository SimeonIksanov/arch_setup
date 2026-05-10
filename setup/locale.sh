#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

STOW_ITEMS=(
  locale
)

stow_install "${STOW_ITEMS[@]}"
