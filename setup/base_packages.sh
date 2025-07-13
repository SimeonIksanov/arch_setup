#!/usr/bin/env bash

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

for pkg in "${PACKAGES[@]}"; do
  sudo pacman -S --noconfirm --needed --color auto "$pkg"
done

timedatectl set-ntp 1
