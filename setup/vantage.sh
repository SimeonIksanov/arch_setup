#!/usr/bin/env bash

# taken from https://github.com/niizam/vantage/blob/main/vantage.sh

VPC="/sys/bus/platform/devices/VPC2004\:*"

get_conservation_mode_status() {
  cat $VPC/conservation_mode | awk '{print ($1 == "1") ? "On" : "Off"}'
}

get_conservation_mode_status
#
# "$SUBMENU_ON") echo "1" | pkexec tee $VPC/conservation_mode ;;
# "$SUBMENU_OFF") echo "0" | pkexec tee $VPC/conservation_mode ;;
#
