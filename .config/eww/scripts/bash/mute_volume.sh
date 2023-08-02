#!/bin/bash

if pgrep -x pipewire-pulse > /dev/null; then 
    pamixer --toggle-mute
fi

eww update VAR_VOLUME="$(scripts/bash/get_volume.sh)"
