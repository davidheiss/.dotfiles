#!/bin/bash

if [ $DESKTOP_SESSION = "bspwm" ]; then
    bspc quit
fi