#!/usr/bin/env bash

set -euo pipefail

# Функция установки
pacman_install() {
  local -a OPTS=(
    -S
    --needed
    --noconfirm
    --color always
  )
  local SUDO=""

  if [ "$EUID" -ne 0 ]; then
    SUDO="sudo"
  fi

  $SUDO pacman "${OPTS[@]}" "$@"
}

yay_install() {
  local -a OPTS=(
    -S
    --needed
    --noconfirm
    --cleanafter
    --answerclean "Y"
    --answerdiff "N"
  )

  yay "${OPTS[@]}" "$@"
}

: "${DOTFILES_DIR:=${HOME}/arch_setup/dotfiles}"
: "${TARGET_DIR:=${HOME}}"

stow_install() {
  local -a OPTS=(
    -v
    --dotfiles
  )

  echo "📁 Применение dotfiles из: ${DOTFILES_DIR}"
  for item in "$@"; do
    local item_path="${DOTFILES_DIR}/${item}"

    echo "🔗 Применение: ${item}"
    stow "${OPTS[@]}" -d "$DOTFILES_DIR" -t "$TARGET_DIR" "$item" || {
      echo "❌ Ошибка при применении ${item}" >&2
      return 1
    }
  done

  echo "✅ Dotfiles применены успешно"
  return 0
}

# source ./shared.sh
# STOW_ITEMS=(vim git bash tmux)
# PACKAGES=( wget zip)
# pacman_install "${PACKAGES[@]}"
# yay_install "${YAY_APPS[@]}"
# stow_install "${STOW_ITEMS[@]}"
