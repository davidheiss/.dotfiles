#!/bin/bash

if [ $DESKTOP_SESSION = "bspwm" ]; then
    xprop -id $(bspc query -N -n) WM_NAME | cut -d\" -f2
fi