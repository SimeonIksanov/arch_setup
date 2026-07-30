#!/usr/bin/env bash
set -euo pipefail

RULES_FILEPATH="/etc/udev/rules.d/99-apple-trackpad.rules"

sudo rm --force $RULES_FILEPATH
echo 'ACTION=="add|change", SUBSYSTEM=="input", ENV{ID_VENDOR_ID}=="05ac", ENV{ID_MODEL_ID}=="025a", ENV{ID_INPUT_TOUCHPAD_INTEGRATION}="internal", ENV{LIBINPUT_DISABLE_WHILE_TYPING}="1"' | sudo tee $RULES_FILEPATH >/dev/null
