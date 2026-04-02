#!/usr/bin/env sh

set -euo pipefail

hyprctl="/usr/bin/hyprctl"
notify="/usr/bin/notify-send"

# notify_touchpad_on() {
#   msg="touchpad on"
#   $notify -e -h string:x-canonical-private-synchronous:anything -t 800 $msg
# }
# notify_touchpad_off() {
#   msg="touchpad off"
#   $notify -e -h string:x-canonical-private-synchronous:anything -t 800 $msg
# }
#
# touchpad_on() {
#   # $hyprctl keyword 'device[bcm5974]:enabled' 'true' #macbook
#   $hyprctl keyword 'device[gxtp5100:00-27c6:01e9-1]:enabled' 'true' #lenovo
#   notify_touchpad_on
# }
# touchpad_off() {
#   # $hyprctl keyword 'device[bcm5974]:enabled' 'false' #macbook
#   $hyprctl keyword 'device[gxtp5100:00-27c6:01e9-1]:enabled' 'false' #lenovo
#   notify_touchpad_off
# }

#
# Set default variables
# XF86TouchpadToggle

DEVICE="device[gxtp5100:00-27c6:01e9-1]:enabled"
STATE_FILE="/tmp/touchpad_state"

if [ -f "$STATE_FILE" ]; then
  # State file exists, read current state
  STATE=$(cat "$STATE_FILE")
else
  # No state file, assume enabled
  STATE="1"
fi

if [ "$STATE" = "1" ]; then
  $hyprctl keyword "$DEVICE" 0
  echo "0" >"$STATE_FILE"
  $notify "Touchpad" "Disabled" -t 1000
else
  $hyprctl keyword "$DEVICE" 1
  echo "1" >"$STATE_FILE"
  $notify "Touchpad" "Enabled" -t 1000
fi
