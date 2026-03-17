#!/usr/bin/env bash
set -euo pipefail

install_bin() {
  URL=https://github.com/marcosnils/bin/releases/latest/download/bin_0.24.2_linux_amd64
  TMP_DST=/tmp
  TMP_FILENAME="bin_app"

  curl -sLSo "$TMP_DST/$TMP_FILENAME" $URL
  # curl -vLo "$TMP_DST/$TMP_FILENAME" $URL

  chmod u+x "$TMP_DST/$TMP_FILENAME"
  "$TMP_DST/$TMP_FILENAME" install github.com/marcosnils/bin ~/.local/bin
  rm "$TMP_DST/$TMP_FILENAME"
}

if ! command -v bin >/dev/null; then
  echo "bin does not exist."
  install_bin
fi

bin install github.com/SagerNet/sing-box
