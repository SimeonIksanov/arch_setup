#!/usr/bin/env bash

YAY_APPS=(
  brave-bin
)

for pkg in "${YAY_APPS[@]}"; do
  yay -S --noconfirm --cleanafter --answerclean "Y" --answerdiff "N" --needed "$pkg"
done
