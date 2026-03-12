#!/usr/bin/env bash

set -euo pipefail

source shared.sh

PACKAGES=(
  bluez
  blueman
  bluez-utils
  #   bluez-tools
)

pacman_install "${PACKAGES[@]}"
