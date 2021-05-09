#!/usr/bin/env sh
# Bind this script with a keyboard shourtcut (eg. in i3 config file)

screen=""
area=""
window=""

chosen=$(printf '%s;%s;%s\n' "$screen" "$area" "$window" \
    | rofi -theme 'screenshot/screenshot.rasi' \
           -dmenu \
           -sep ';' \
           -selected-row 1)

case "$chosen" in
    "$screen")
        spectacle -f -b
    ;;

    "$area")
        spectacle -r -b
    ;;

    "$window")
        spectacle -u -b
    ;;

    *) exit 1 ;;
esac
