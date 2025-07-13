#!/usr/bin/env bash
DRIVERS=(
	linux-headers
	broadcom-wl-dkms
	brightnessctl
)

for pkg in "${DRIVERS[@]}"; do
	sudo pacman -S --confirm --needed "$pkg"
done
