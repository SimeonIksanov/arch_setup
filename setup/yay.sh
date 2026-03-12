#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh
PACKAGES=(git base-devel)
pacman_install "${PACKAGES[@]}"

rm -rf yay-bin
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

cd ..
rm -rf yay-bin
