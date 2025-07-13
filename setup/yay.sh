#!/usr/bin/env bash
sudo pacman -S --noconfirm --needed git base-devel

rm -rf yay-bin
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

cd ..
rm -rf yay-bin
