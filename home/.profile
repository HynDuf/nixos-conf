#!/usr/bin/env bash

# if test -z "$DISPLAY" -a \( "$XDG_VTNR" = 1 -o "$(tty)" = "/dev/tty1" \)
#     exec startx
# end

if [[ -z "$DISPLAY" && ( "$XDG_VTNR" = 1 || "$(tty)" = "/dev/tty1" ) ]]; then
    exec startx
fi
