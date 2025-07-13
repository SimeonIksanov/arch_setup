#!/usr/bin/env sh
brightnessctl="/usr/bin/brightnessctl"
notify="/usr/bin/notify-send"

notify_vol() {
  value=$( $brightnessctl get )
  $notify -e -h string:x-canonical-private-synchronous:anything -t 800 "Brightness: ${value}"
}

change_brightness() {
  local action=$1
  local step=$2
  local delta="-"

  [ "${action}" = "up" ] && delta="+"
  $brightnessctl -e4 -n2 set $step%$delta
  notify_vol
}

# Set default variables
step=1

case $1 in
    up|down) change_brightness "$1" "$step" ;;
esac
