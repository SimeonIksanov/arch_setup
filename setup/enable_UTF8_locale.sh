#!/usr/bin/env bash
set -euo pipefail
source ./shared.sh

# File path
LOCALE_GEN="/etc/locale.gen"
LINE_EN="#en_US.UTF-8 UTF-8"
LINE_RU="#ru_RU.UTF-8 UTF-8"
LINE_GB="#en_GB.UTF-8 UTF-8"
PATTERN="#"
REPLACE=""

sudo sed -i "/^${LINE_EN}/s/^$PATTERN/$REPLACE/" $LOCALE_GEN
sudo sed -i "/^${LINE_GB}/s/^$PATTERN/$REPLACE/" $LOCALE_GEN
sudo sed -i "/^${LINE_RU}/s/^$PATTERN/$REPLACE/" $LOCALE_GEN

sudo locale-gen
