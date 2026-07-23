#!/bin/bash
TOUCHPAD="asuf1209:00-2808:0219-touchpad"
KEYBOARD="at-translated-set-2-keyboard"
DELAY=0.5

# Track the background timer process ID
TIMER_PID=""

# Use hyprctl to listen for active keyboard events
hyprctl monitor | grep --line-buffered "key:" | while read -r line; do
    # Quickly disable touchpad upon keypress
    hyprctl keyword device:"$TOUCHPAD":enabled false

    # Kill any existing countdown timer
    if [ -n "$TIMER_PID" ]; then
        kill "$TIMER_PID" 2>/dev/null
    fi

    # Spawn a new background timer to re-enable
    (
        sleep "$DELAY"
        hyprctl keyword device:"$TOUCHPAD":enabled true
    ) &
    TIMER_PID=$!
done
