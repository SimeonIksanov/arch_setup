#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

STOW_ITEMS=(
  scripts
)

stow_install "${STOW_ITEMS[@]}"
