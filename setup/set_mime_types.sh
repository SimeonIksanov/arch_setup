#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

ITEMS=(
  mimeapps
)

stow_install "${STOW_ITEMS[@]}"
