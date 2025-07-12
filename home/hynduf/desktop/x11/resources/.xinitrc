#!/usr/bin/env bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -merge ~/.Xresources
xrandr --output eDP-1 --mode 3072x1920 --rate 120
exec bspwm
