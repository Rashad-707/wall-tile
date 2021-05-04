#!/bin/bash

# Terminate already running bar instances
    killall -q polybar

# Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
    polybar wall-tile-right &
    polybar wall-tile-right-background &

    polybar wall-tile-left &
    polybar wall-tile-left-background &

    polybar wall-tile-center-background &
