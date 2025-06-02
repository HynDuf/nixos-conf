#!/usr/bin/env bash
base_dir="$HOME/.config/eww/"
playerctl metadata -F -f '{{playerName}} {{title}} {{artist}} {{mpris:artUrl}} {{status}} {{mpris:length}}' | while read -r line; do
    name=$(playerctl metadata -f "{{playerName}}")
    title=$(playerctl metadata -f "{{title}}")
    artist=$(playerctl metadata -f "{{artist}}")
    artUrl=$(playerctl metadata -f "{{mpris:artUrl}}")
    status=$(playerctl metadata -f "{{status}}")
    length=$(playerctl metadata -f "{{mpris:length}}")
    if [[ $length != "" ]]; then
        length=$(($length / 1000000))
        length=$(echo "($length + 0.5) / 1" | bc)
    fi
    
    # Check if artUrl is a remote URL
    if [[ $artUrl =~ ^http ]]; then
        # Delete the image for the current song
        rm -f "${base_dir}image.jpg"
        # Download the album art for the current song as "image.jpg"
        wget -q -O "${base_dir}image.jpg" "$artUrl"
        artUrl="${base_dir}image.jpg"
    fi
    
    title=$(echo "$title" | awk '{first=substr($0, 1, 20); second=substr($0, 21); gsub(/^ */, "", second); print first "\n" second}')
    lengthStr=$(playerctl metadata -f "{{duration(mpris:length)}}")

    JSON_STRING=$( jq -n \
                --arg name "$name" \
                --arg title "$title" \
                --arg artist "$artist" \
                --arg artUrl "$artUrl" \
                --arg status "$status" \
                --arg length "$length" \
                --arg lengthStr "$lengthStr" \
                '{name: $name, title: $title, artist: $artist, artUrl: $artUrl, status: $status, length: $length, lengthStr: $lengthStr}' )
    echo $JSON_STRING
done
