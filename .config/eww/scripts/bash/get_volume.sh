#!/bin/sh

if pgrep -x pipewire-pulse > /dev/null; then 
    volume=$(pamixer --get-volume)
    mute=$(pamixer --get-mute)
    if [ $mute = "true" ]; then
        icon="󰖁"
    elif [ $volume -gt 66 ]; then
        icon="󰕾"
    elif [ $volume -gt 33 ]; then
        icon="󰖀"
    else
        icon="󰕿"
    fi
    echo "{\"icon\": \"$icon\", \"volume\": $volume, \"mute\": $mute}"
fi