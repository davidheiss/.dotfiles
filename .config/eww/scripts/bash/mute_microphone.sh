#!/bin/bash

output=$(amixer get Capture)
read left right <<< $(grep --color -oE '\[(off|on)\]' <<< $output | tr -d [] | xargs)

if [ $left = "off" ] && [ $right = "off" ]; then
    amixer -q set Capture cap
else
    amixer -q set Capture nocap
fi

eww update VAR_MICROPHONE="$(scripts/bash/get_microphone.sh)"
