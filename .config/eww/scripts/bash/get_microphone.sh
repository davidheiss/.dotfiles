#!/bin/sh

output=$(amixer get Capture)

read left right <<< $(grep -oE '[0-9]+%' <<< $output | tr -d % | xargs)
volume=$(expr "( $left + $right ) / 2" | bc)

read left right <<< $(grep --color -oE '\[(off|on)\]' <<< $output | tr -d [] | xargs)

if [ $left = "off" ] && [ $right = "off" ]; then
    icon="󰍭"
    mute="true"
else
    icon="󰍬"
    mute="false"
fi

echo "{\"icon\": \"$icon\", \"volume\": $volume, \"mute\": $mute}"