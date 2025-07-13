#!/usr/bin/env bash

set -euo pipefail # хорошая практика: выход при ошибках

SRC='https://github.com/skevetter/devpod/releases/download/v0.14.1/devpod-linux-amd64'
DEST_DIR="$HOME/apps"
DEST_FILE="$DEST_DIR/devpod-linux-amd64"
LINK_PATH="$HOME/.local/bin/devpod"

# 1. Удаляем старый скачанный файл, если существует
if [[ -f "$DEST_FILE" ]]; then
  echo "🗑️  Удаляем старый бинарник: $DEST_FILE"
  rm -f "$DEST_FILE"
fi

# 2. Скачиваем файл
echo "⬇️  Скачиваем devpod..."
mkdir -p "$DEST_DIR"
curl -sSL --create-dirs --output-dir "$DEST_DIR" -O "$SRC"

# 3. Делаем файл исполняемым (важно для бинарников!)
chmod u+x "$DEST_FILE"

# 4. Удаляем старую ссылку, если существует (и не является "битой")
if [[ -L "$LINK_PATH" ]] || [[ -e "$LINK_PATH" ]]; then
  echo "🗑️  Удаляем старую ссылку: $LINK_PATH"
  rm -f "$LINK_PATH"
fi

# 5. Создаём новую символическую ссылку
mkdir -p "$(dirname "$LINK_PATH")"
ln -s "$DEST_FILE" "$LINK_PATH"

echo "⚙️  Устанавливаем параметры контекста..."
devpod context set-options --option TELEMETRY=false
devpod context set-options --option DOTFILES_SCRIPT="setup/devpod_setup_dotfiles.sh"
devpod context set-options --option DOTFILES_URL="https://github.com/SimeonIksanov/arch_setup.git"

echo "✅ Готово! DevPod установлен в $LINK_PATH"
