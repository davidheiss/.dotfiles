#!/bin/bash

if [ $DESKTOP_SESSION = "bspwm" ]; then
    bspc desktop -f $1
fi