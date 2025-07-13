#!/usr/bin/env bash

source shared.sh

PACKAGES=(
  zsh
  # zsh-autocomplete
  zsh-completions
  # zsh-autosuggestions
)
for pkg in "${PACKAGES[@]}"; do
	sudo pacman -S --noconfirm --needed "$pkg"
done

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


ITEMS=(
  zsh
)

for item in "${ITEMS[@]}"; do
  stow --dotfiles -v -d ${HOME}/arch_setup/dotfiles -t ${HOME} "$item"
done
