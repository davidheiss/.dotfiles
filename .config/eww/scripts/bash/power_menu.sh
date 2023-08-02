#!/bin/bash

if eww windows | grep -q "^*power_menu"; then
    eww close power_menu
else
    eww open power_menu
fi