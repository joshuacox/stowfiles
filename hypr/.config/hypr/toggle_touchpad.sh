#!/bin/bash
TOUCHPAD="elan0542:00-04f3:3368-touchpad"
MOUSE="elan0542:00-04f3:3368-mouse"

# Force Hyprland to always keep the device protocols active
hyprctl keyword "device[$MOUSE]:enabled" true
hyprctl keyword "device[$TOUCHPAD]:enabled" true

# Optional: Send a generic notification since the hardware handles the rest
notify-send "Touchpad" "Hardware state toggled" -i input-touchpad


exit 0

#!/bin/bash
STATE_FILE="/tmp/touchpad_state"
TOUCHPAD="elan0542:00-04f3:3368-touchpad"
MOUSE="elan0542:00-04f3:3368-mouse"

if [ ! -f "$STATE_FILE" ]; then
    echo "enabled" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

if [ "$CURRENT_STATE" = "enabled" ]; then
    hyprctl keyword "device[$MOUSE]:enabled" false
    hyprctl keyword "device[$TOUCHPAD]:enabled" false
    echo "disabled" > "$STATE_FILE"
    notify-send "Touchpad" "Disabled" -i input-touchpad
else
    hyprctl keyword "device[$MOUSE]:enabled" true
    hyprctl keyword "device[$TOUCHPAD]:enabled" true
    echo "enabled" > "$STATE_FILE"
    notify-send "Touchpad" "Enabled" -i input-touchpad
fi

