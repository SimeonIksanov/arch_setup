#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

PACKAGES=(
  sddm
  qt5-graphicaleffects
  qt5-quickcontrols2
  qt5-svg
)

# https://framagit.org/MarianArlt/sddm-sugar-candy
# download and put into /usr/share/sddm/themes/

pacman_install "${PACKAGES[@]}"

sudo systemctl enable sddm.service

sudo mkdir -p /etc/sddm.conf.d

sudo tee /etc/sddm.conf.d/session.conf >/dev/null <<'EOF'
[Autologin]
Session=hyprland

[General]
DisplayServer=wayland
GreeterEnvironment=QT_SCREEN_SCALE_FACTORS=1.5,QT_FONT_DPI=192
EOF

read -rp "Have you downloaded a sugar-candy theme? [y/N] " response
case "$response" in
    [yY]|[yY][eE][sS])
        sudo tee /etc/sddm.conf.d/theme.conf >/dev/null <<'EOF'
[Theme]
Current=sugar-candy
EOF
        ;;
    *)
        exit 0
        ;;
esac
