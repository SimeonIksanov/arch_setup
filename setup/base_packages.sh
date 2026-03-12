#!/usr/bin/env bash

set -euo pipefail

source ./shared.sh

PACKAGES=(
  bind
  curl
  fd
  fzf
  jq
  openssh
  ripgrep
  stow
  traceroute
  unzip
  wget
  zip
)

pacman_install "${PACKAGES[@]}"

timedatectl set-ntp 1
