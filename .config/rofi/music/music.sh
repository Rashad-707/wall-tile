#!/usr/bin/env sh

# Set here your music directory
MUSIC_DIR="$HOME/Music"


MUSIC_ARRAY=($MUSIC_DIR/*)
chosen=$( for FILE in "${MUSIC_ARRAY[@]}"; do printf '%s;' "`basename "${FILE%%.*}"`"; done\
        | rofi -theme 'music/music.rasi' \
        -dmenu \
        -i \
        -p "" \
        -sep ';' \
        -selected-row 0)

if [ "$?" -eq "1" ]; then
    exit 0
fi

mpc clear && mpc add "$MUSIC_DIR/${chosen}.mp3" && mpc play
