#!/usr/bin/env bash

# File: ~/.local/bin/hypr-layout-toggle.sh
# Detect if we are currently mirroring
IS_MIRROR=$(hyprctl monitors -j | jq '.[] | select(.name == "HDMI-A-1") | .mirrorOf' -r)

if [ "$IS_MIRROR" = "eDP-1" ]; then
    # SWITCH TO USUAL DESK MODE: Restore native resolution & side portrait monitor
    hyprctl keyword monitor "eDP-1, 2880x1800@120.00Hz, 0x0, 1.5"
    hyprctl keyword monitor "HDMI-A-1, 1280x1024@75.03Hz, auto-left, 1, transform, 1"
    notify-send "Display Layout" "Switched to standard Desk Setup"
else
    # SWITCH TO PROJECTOR MODE: Match both to 1080p and mirror
    hyprctl keyword monitor "eDP-1, 1920x1080@120.00Hz, 0x0, 1"
    hyprctl keyword monitor "HDMI-A-1, 1920x1080, auto, 1, mirror, eDP-1"
    notify-send "Display Layout" "Switched to 1080p Mirror Setup"
fi
