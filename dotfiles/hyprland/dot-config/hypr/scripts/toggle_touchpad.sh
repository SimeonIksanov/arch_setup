#!/usr/bin/env sh

set -euo pipefail

hyprctl="/usr/bin/hyprctl"
notify="/usr/bin/notify-send"

notify_touchpad_on() {
  msg="touchpad on"
  $notify -e -h string:x-canonical-private-synchronous:anything -t 800 $msg
}
notify_touchpad_off() {
  msg="touchpad off"
  $notify -e -h string:x-canonical-private-synchronous:anything -t 800 $msg
}

touchpad_on() {
  $hyprctl keyword 'device[bcm5974]:enabled' 'true'
  notify_touchpad_on
}
touchpad_off() {
  $hyprctl keyword 'device[bcm5974]:enabled' 'false'
  notify_touchpad_off
}

#
# Set default variables
# XF86TouchpadToggle
