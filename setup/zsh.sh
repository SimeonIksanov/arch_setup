#!/usr/bin/env bash
set -euo pipefail

source shared.sh

PACKAGES=(
  zsh
  # zsh-autocomplete
  zsh-completions
  # zsh-autosuggestions
)
STOW_ITEMS=(
  zsh
)

pacman_install "${PACKAGES[@]}"
stow_install "${STOW_ITEMS[@]}"

CURRENT_SHELL=$(basename "$SHELL")
ZSH_PATH=$(which zsh)

if [ "$CURRENT_SHELL" != "zsh" ]; then
  if [ -x "$ZSH_PATH" ]; then
    echo "Текущий shell: $CURRENT_SHELL"
    echo "Меняем основной shell на: $ZSH_PATH"
    chsh -s "$ZSH_PATH"
    echo "Shell успешно изменён на zsh. Перезайдите в терминал."
  else
    echo "zsh не установлен. Пожалуйста, установите zsh и повторите попытку."
    exit 1
  fi
else
  echo "zsh уже установлен как основной shell."
fi
