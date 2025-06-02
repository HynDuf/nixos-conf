#!/usr/bin/env bash

no_error() {
    pkill check_volume.sh
    ~/.config/eww/scripts/check_volume.sh &
}

error() {
    ~/.config/eww/scripts/check_volume.sh &
}

no_error || error

# requieres pamixer

case $1 in
--up)
  pamixer -u >/dev/null
  pamixer -i 5 >/dev/null
  ;;
--down)
  pamixer -u >/dev/null
  pamixer -d 5 >/dev/null
  ;;
--toggle)
  pamixer -t >/dev/null
  ;;
esac
