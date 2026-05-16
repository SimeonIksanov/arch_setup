#!/usr/bin/env bash

set -euo pipefail

MOUNT_BASE="${HOME}/synologyNas"
NAS_HOST="synologynas.lan"
SHARES=("Data" "Courses")

echo "Setting up Synology NAS mounts..."

for share in "${SHARES[@]}"; do
  mkdir -p "${MOUNT_BASE}/${share}"
  echo "  ensured directory: ${MOUNT_BASE}/${share}"
done

for share in "${SHARES[@]}"; do
  MOUNT_POINT="${MOUNT_BASE}/${share}"
  FSTAB_ENTRY="//${NAS_HOST}/${share} ${MOUNT_POINT} cifs noperm,user,noauto,credentials=${HOME}/.synologyNasCredentials.ini 0 0"

  if grep -qF "${MOUNT_POINT}" /etc/fstab; then
    echo "  fstab entry already exists for ${share}"
  else
    echo "${FSTAB_ENTRY}" | sudo tee -a /etc/fstab >/dev/null
    echo "  added fstab entry for ${share}"
  fi
done

echo "Synology NAS setup complete."
echo "Run 'sudo mount -a' to apply fstab changes."
