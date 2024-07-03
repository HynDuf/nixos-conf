#!/usr/bin/env bash

dismiss() {
    dbus-send --session --type=method_call \
        --dest=org.freedesktop.Notifications \
        /org/freedesktop/Notifications \
        org.freedesktop.Notifications.DismissPopup \
        uint32:$1
}

log_file="$HOME/.cache/notifications.json"

read_log_file() {
    if [ ! -f "$log_file" ]; then
        echo '{"count": 0, "notifications": [], "popups": []}' > "$log_file"
    fi

    cat "$log_file"
}

update_log_file() {
    local id="$1"
    local current_log
    current_log=$(read_log_file)

    # Convert the ID to a number for comparison
    current_log=$(echo "$current_log" | jq --argjson id "$id" '
        .notifications = (.notifications | map(select(.id != $id))) |
        .count = (.notifications | length)
    ')

    echo "$current_log" > "$log_file"
    eww update notifications="$current_log"
}

close() {
    id_to_remove="$1"
    update_log_file "$id_to_remove"
    # dbus-send --session --type=method_call \
    #     --dest=org.freedesktop.Notifications \
    #     /org/freedesktop/Notifications \
    #     org.freedesktop.Notifications.CloseNotification \
    #     uint32:$1
}

action() {
    dbus-send --session --type=method_call \
        --dest=org.freedesktop.Notifications \
        /org/freedesktop/Notifications \
        org.freedesktop.Notifications.InvokeAction \
        uint32:$1 string:$2
}

clear_all() {
    dbus-send --session --type=method_call \
        --dest=org.freedesktop.Notifications \
        /org/freedesktop/Notifications \
        org.freedesktop.Notifications.ClearAll
}

get_current() {
    dbus-send --session --type=method_call \
        --dest=org.freedesktop.Notifications \
        /org/freedesktop/Notifications \
        org.freedesktop.Notifications.GetCurrent
}

get_dnd() {
    dbus-send --session --type=method_call \
        --dest=org.freedesktop.Notifications \
        /org/freedesktop/Notifications \
        org.freedesktop.Notifications.GetDNDState
}

toggle_dnd() {
    dbus-send --session --type=method_call \
        --dest=org.freedesktop.Notifications \
        /org/freedesktop/Notifications \
        org.freedesktop.Notifications.ToggleDND
}

if [[ $1 == 'dismiss' ]]; then dismiss $2 $3; fi
if [[ $1 == 'close' ]]; then close $2; fi
if [[ $1 == 'action' ]]; then action $2 $3; fi
if [[ $1 == 'clear' ]]; then clear_all; fi
if [[ $1 == 'current' ]]; then get_current; fi
if [[ $1 == 'getdnd' ]]; then get_dnd; fi
if [[ $1 == 'togglednd' ]]; then toggle_dnd && get_dnd; fi
