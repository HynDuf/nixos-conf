#!/usr/bin/env bash

pkill eww
eww daemon
eww open notifications_popup
nix-shell ~/.config/eww/scripts/notifications_shell.nix --run "python ~/.config/eww/scripts/notifications.py" &
