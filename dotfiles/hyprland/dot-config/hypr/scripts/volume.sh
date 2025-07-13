#!/usr/bin/env sh
wpctl="/usr/bin/wpctl"
notify="/usr/bin/notify-send"
grep="/usr/bin/grep"
awk="/usr/bin/awk"

notify_vol() {
  vol=$($wpctl get-volume @DEFAULT_AUDIO_SINK@ | $awk -F'[: ]+' '{print int($2 * 100)}' )
  $notify -e -h string:x-canonical-private-synchronous:anything -t 800 "Volume: ${vol}"
}

notify_mute() {
    msg="Unmuted"
    count=$($wpctl get-volume @DEFAULT_AUDIO_SINK@ | $grep -ic "muted" )
    [[ $count -gt 0 ]] && msg="Muted"
    $notify -e -h string:x-canonical-private-synchronous:anything -t 800 $msg
}

change_volume() {
    local action=$1
    local step=$2
    local delta="-"

    [ "${action}" = "up" ] && delta="+"
    $wpctl set-volume @DEFAULT_AUDIO_SINK@ $step%$delta
    notify_vol
}

toggle_mute() {
  $wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
  notify_mute
}

# Set default variables
step=1

case $1 in
    up|down) change_volume "$1" "$step" ;;
    mute) toggle_mute ;;
    *) print_usage ;;
esac
