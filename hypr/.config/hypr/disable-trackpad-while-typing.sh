#!/bin/bash
# config values can be overridden by env vars
: "${TOUCHPAD:=asuf1209:00-2808:0219-touchpad}"
: ${DELAY:=1}
: ${GAME_MODE_SEMAFORE_FILE:=/tmp/.game_mode_on}
: ${VERBOSITY:=1}

# initializers not to be edited
TIMER_PID=""
STATUS="enabled"

sleep 1

if [[ ${VERBOSITY} -gt 0 ]]; then
  notify-send "Touchpad Debug" "Monitoring keyboard input layers..." --icon=input-touchpad --expire-time=2000
fi

# Stream global input event logs filtered by keyboard key presses
libinput debug-events | grep --line-buffered "KEYBOARD_.*pressed" | while read -r line; do

  if [[ -f "${GAME_MODE_SEMAFORE_FILE}" ]]; then 
	if [[ ${VERBOSITY} -gt 100 ]]; then
          echo "game_mode_on skipping"
	fi
  else
    # If the touchpad is on, lock it out immediately
    if [[ "$STATUS" -eq "enabled" ]]; then
        hyprctl keyword "device[$TOUCHPAD]:enabled" false
        STATUS="disabled"
	if [[ ${VERBOSITY} -gt 4 ]]; then
          echo "Touchpad Status" "❌ Touchpad DISABLED (Typing...) --icon=input-touchpad --expire-time=1000"
	fi
	if [[ ${VERBOSITY} -gt 3 ]]; then
          notify-send "Touchpad Status" "❌ Touchpad DISABLED (Typing...)" --icon=input-touchpad --expire-time=1000
	fi
    fi
  fi

    # Drop older concurrent active background sleep timers
    if [[ -n "$TIMER_PID" ]]; then
        kill "$TIMER_PID" 2>/dev/null
    fi

    # Setup a clean background thread to revert back once typing pauses
    (
        sleep "$DELAY"
        if [[ "$STATUS" -eq "disabled" ]]; then
          hyprctl keyword "device[$TOUCHPAD]:enabled" true
  	if [[ ${VERBOSITY} -gt 2 ]]; then
            echo "Touchpad Status ✅ Touchpad ENABLED --icon=input-touchpad --expire-time=1000"
  	fi
  	if [[ ${VERBOSITY} -gt 1 ]]; then
            notify-send "Touchpad Status" "✅ Touchpad ENABLED" --icon=input-touchpad --expire-time=1000
  	fi
          STATUS="enabled"
        fi
    ) &
    TIMER_PID=$!
done
