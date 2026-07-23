#!/bin/bash

# Disable trackpad while typing using sysfs inhibit mechanism
# Also enable trackpad on window focus change for smooth window switching
# Optimized for efficiency - minimal operations per keypress

TIMEOUT=1.5
PID_FILE="/tmp/dwt-timeout-pid"
CANCEL_TIMEOUT="/tmp/dwt-cancel-timeout"
SCRIPT_PID_FILE="/tmp/dwt-script-pid"

# Check if already running
if [ -f "$SCRIPT_PID_FILE" ] && kill -0 "$(cat "$SCRIPT_PID_FILE")" 2>/dev/null; then
  echo "Script is already running (PID: $(cat "$SCRIPT_PID_FILE"))"
  exit 1
fi

# Store our PID
echo $$ > "$SCRIPT_PID_FILE"

# Keyboard device configuration for keyd
KEYBOARD_DEVICE="/dev/input/event2" # Change this if your keyboard is on a different event device. By default it's usually event1 for the internal hardware keyboard.

# Configuration for instant trackpad enable - array of keys
INSTANT_ENABLE_KEYS=(
  "ESCAPE"
  "LEFTCTRL" "RIGHTCTRL"
  "LEFTALT" "RIGHTALT"
  "LEFTSHIFT" "RIGHTSHIFT"
  "LEFTMETA" "RIGHTMETA"
  "ESC" # For escape sequences like ^[ from keyd remapped keys
  "TAB"
  "FN" # Might not work on all keyboards (firmware dependent)
  "DELETE" "BACKSPACE"
  "UP" "DOWN" "LEFT" "RIGHT"
  "ENTER" "RETURN"
)

# Find the trackpad input device
TRACKPAD_SYSFS=""
for input_dev in /sys/class/input/input*; do
  if [ -r "$input_dev/name" ] && grep -qi "trackpad" "$input_dev/name" 2>/dev/null; then
    TRACKPAD_SYSFS="$input_dev"
    break
  fi
done

if [ -z "$TRACKPAD_SYSFS" ]; then
  echo "Could not find trackpad sysfs path"
  exit 1
fi

echo "Found trackpad at: $TRACKPAD_SYSFS"
echo "Device name: $(cat "$TRACKPAD_SYSFS/name")"

# Pre-determine trackpad control method for efficiency
if [ -w "$TRACKPAD_SYSFS/inhibited" ]; then
  TRACKPAD_FILE="$TRACKPAD_SYSFS/inhibited"
  USE_SUDO=false
elif [ -w "$TRACKPAD_SYSFS/device/inhibited" ]; then
  TRACKPAD_FILE="$TRACKPAD_SYSFS/device/inhibited"
  USE_SUDO=false
elif sudo -n true 2>/dev/null; then
  if [ -f "$TRACKPAD_SYSFS/inhibited" ]; then
    TRACKPAD_FILE="$TRACKPAD_SYSFS/inhibited"
  elif [ -f "$TRACKPAD_SYSFS/device/inhibited" ]; then
    TRACKPAD_FILE="$TRACKPAD_SYSFS/device/inhibited"
  fi
  USE_SUDO=true
else
  echo "Error: Cannot control trackpad - no permissions"
  exit 1
fi

# Efficient trackpad control functions
disable_trackpad() {
  if $USE_SUDO; then
    echo 1 | sudo tee "$TRACKPAD_FILE" >/dev/null 2>&1
  else
    echo 1 >"$TRACKPAD_FILE" 2>/dev/null
  fi
}

enable_trackpad() {
  if $USE_SUDO; then
    echo 0 | sudo tee "$TRACKPAD_FILE" >/dev/null 2>&1
  else
    echo 0 >"$TRACKPAD_FILE" 2>/dev/null
  fi
}

# Verify keyboard device exists
if [ ! -c "$KEYBOARD_DEVICE" ]; then
  echo "Keyboard device $KEYBOARD_DEVICE not found"
  echo "Available input devices:"
  ls /dev/input/event* 2>/dev/null || echo "No event devices found"
  echo "Update KEYBOARD_DEVICE variable in script to correct device"
  exit 1
fi

echo "Monitoring keyboard: $KEYBOARD_DEVICE"
echo "Monitoring Hyprland window focus changes"
echo "Trackpad will be disabled while typing (timeout: ${TIMEOUT}s)"
echo "Trackpad will be enabled on window focus change"
echo "Press Escape or any modifier key to instantly enable trackpad"
echo "Press Ctrl+C to stop"

# Get Hyprland instance signature
ACTUAL_UID="${SUDO_UID:-$(id -u)}"

if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
  HYPRLAND_INSTANCE_SIGNATURE=$(ls /run/user/$ACTUAL_UID/hypr/ 2>/dev/null | sort -r | head -1)
fi

# Start window focus monitor in background using socat
if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
  (
    # dwt-focus-monitor: Monitor Hyprland window focus changes
    sudo -u "${SUDO_USER:-$USER}" HYPRLAND_INSTANCE_SIGNATURE="$HYPRLAND_INSTANCE_SIGNATURE" socat -u UNIX-CONNECT:/run/user/$ACTUAL_UID/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
      if echo "$line" | grep -q "activewindow>>"; then
        echo "Window focus changed - enabling trackpad"
        enable_trackpad
        # Signal timeout cancellation
        touch "$CANCEL_TIMEOUT"
      fi
    done
  ) &
  FOCUS_MONITOR_PID=$!
else
  FOCUS_MONITOR_PID=""
fi

# Function to cleanup on exit
cleanup() {
  echo "Cleaning up..."
  enable_trackpad
  [ -n "$FOCUS_MONITOR_PID" ] && kill $FOCUS_MONITOR_PID 2>/dev/null
  rm -f "$PID_FILE" "$CANCEL_TIMEOUT" "$SCRIPT_PID_FILE"
  exit 0
}

trap cleanup SIGINT SIGTERM

# Get all window focus movement keybindings at startup
echo "Reading Hyprland keybindings for window focus movement..."
FOCUS_BINDINGS=""
if [ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
  # Get all bindings and parse the structured format
  focus_commands="movefocus|movewindow|workspace|movetoworkspace|focuswindow|swapwindow|moveworkspacetomonitor|focusmonitor"

  # Parse hyprctl binds structured output
  modmask=""
  key=""
  dispatcher=""

  while IFS= read -r line; do
    if echo "$line" | grep -q "modmask:"; then
      modmask=$(echo "$line" | sed 's/.*modmask: //')
    elif echo "$line" | grep -q "key:"; then
      key=$(echo "$line" | sed 's/.*key: //')
    elif echo "$line" | grep -q "dispatcher:"; then
      dispatcher=$(echo "$line" | sed 's/.*dispatcher: //')

      # If this is a focus-related dispatcher, convert modmask to modifier names
      if echo "$dispatcher" | grep -qE "^($focus_commands)$"; then
        modifiers=""
        # Convert modmask bits to modifier names (Hyprland modmask format)
        [ $((modmask & 1)) -ne 0 ] && modifiers="${modifiers}SHIFT_"
        [ $((modmask & 2)) -ne 0 ] && modifiers="${modifiers}CAPS_"
        [ $((modmask & 4)) -ne 0 ] && modifiers="${modifiers}CTRL_"
        [ $((modmask & 8)) -ne 0 ] && modifiers="${modifiers}ALT_"
        [ $((modmask & 64)) -ne 0 ] && modifiers="${modifiers}SUPER_"

        # Remove trailing underscore and create binding
        modifiers=$(echo "$modifiers" | sed 's/_$//')
        if [ -n "$modifiers" ]; then
          binding="${modifiers}+${key}"
        else
          binding="$key"
        fi

        FOCUS_BINDINGS="$FOCUS_BINDINGS $binding"
      fi

      # Reset for next binding
      modmask=""
      key=""
      dispatcher=""
    fi
  done < <(sudo -u "${SUDO_USER:-$USER}" HYPRLAND_INSTANCE_SIGNATURE="$HYPRLAND_INSTANCE_SIGNATURE" hyprctl binds 2>/dev/null)
fi

echo "Detected focus movement bindings:$FOCUS_BINDINGS"

# Track modifier key states for efficient combo detection
CTRL_HELD=false
ALT_HELD=false
SHIFT_HELD=false
SUPER_HELD=false

# Function to check if current modifier+key combo is a focus movement binding
is_focus_binding() {
  local key="$1"
  local current_combo=""

  # Build current modifier combination in Hyprland order (matches the binding output)
  $SHIFT_HELD && current_combo="${current_combo}SHIFT_"
  $CTRL_HELD && current_combo="${current_combo}CTRL_"
  $ALT_HELD && current_combo="${current_combo}ALT_"
  $SUPER_HELD && current_combo="${current_combo}SUPER_"

  # Remove trailing underscore and add key
  current_combo=$(echo "$current_combo" | sed 's/_$//')
  [ -n "$current_combo" ] && current_combo="${current_combo}+${key}"
  [ -z "$current_combo" ] && current_combo="$key"

  # Check if this combo matches any focus binding
  echo "$FOCUS_BINDINGS" | grep -q "\<$current_combo\>"
}

# Monitor keyboard with evtest
evtest "$KEYBOARD_DEVICE" | while read -r line; do
  # Track all modifier key states and check for instant enable on press
  if echo "$line" | grep -q "KEY_LEFTMETA.*value 1\|KEY_RIGHTMETA.*value 1"; then
    SUPER_HELD=true
    if echo "$line" | grep -q "KEY_LEFTMETA.*value 1"; then
      echo "LEFTMETA pressed - enabling trackpad instantly"
    else
      echo "RIGHTMETA pressed - enabling trackpad instantly"
    fi
    enable_trackpad
    touch "$CANCEL_TIMEOUT"
    continue
  elif echo "$line" | grep -q "KEY_LEFTMETA.*value 0\|KEY_RIGHTMETA.*value 0"; then
    SUPER_HELD=false
    continue
  elif echo "$line" | grep -q "KEY_LEFTCTRL.*value 1\|KEY_RIGHTCTRL.*value 1"; then
    CTRL_HELD=true
    if echo "$line" | grep -q "KEY_LEFTCTRL.*value 1"; then
      echo "LEFTCTRL pressed - enabling trackpad instantly"
    else
      echo "RIGHTCTRL pressed - enabling trackpad instantly"
    fi
    enable_trackpad
    touch "$CANCEL_TIMEOUT"
    continue
  elif echo "$line" | grep -q "KEY_LEFTCTRL.*value 0\|KEY_RIGHTCTRL.*value 0"; then
    CTRL_HELD=false
    continue
  elif echo "$line" | grep -q "KEY_LEFTALT.*value 1\|KEY_RIGHTALT.*value 1"; then
    ALT_HELD=true
    if echo "$line" | grep -q "KEY_LEFTALT.*value 1"; then
      echo "LEFTALT pressed - enabling trackpad instantly"
    else
      echo "RIGHTALT pressed - enabling trackpad instantly"
    fi
    enable_trackpad
    touch "$CANCEL_TIMEOUT"
    continue
  elif echo "$line" | grep -q "KEY_LEFTALT.*value 0\|KEY_RIGHTALT.*value 0"; then
    ALT_HELD=false
    continue
  elif echo "$line" | grep -q "KEY_LEFTSHIFT.*value 1\|KEY_RIGHTSHIFT.*value 1"; then
    SHIFT_HELD=true
    if echo "$line" | grep -q "KEY_LEFTSHIFT.*value 1"; then
      echo "LEFTSHIFT pressed - enabling trackpad instantly"
    else
      echo "RIGHTSHIFT pressed - enabling trackpad instantly"
    fi
    enable_trackpad
    touch "$CANCEL_TIMEOUT"
    continue
  elif echo "$line" | grep -q "KEY_LEFTSHIFT.*value 0\|KEY_RIGHTSHIFT.*value 0"; then
    SHIFT_HELD=false
    continue
  fi

  # Look for key press events (value 1 = press)
  if echo "$line" | grep -q "EV_KEY.*value 1"; then
    # Skip modifier keys (already handled above)
    if echo "$line" | grep -qE "(KEY_LEFT(SHIFT|CTRL|ALT|META)|KEY_RIGHT(SHIFT|CTRL|ALT|META)|KEY_COMPOSE)"; then
      continue
    fi

    # Extract the key name from evtest output
    key_name=$(echo "$line" | sed -n 's/.*(\(KEY_[^)]*\)).*/\1/p')
    if [ -n "$key_name" ]; then
      # Convert KEY_* to the format used in Hyprland binds (remove KEY_ prefix)
      hypr_key=$(echo "$key_name" | sed 's/^KEY_//')

      # Check for instant enable keys (Escape or any modifier)
      for enable_key in "${INSTANT_ENABLE_KEYS[@]}"; do
        if [ "$hypr_key" = "$enable_key" ]; then
          echo "$enable_key pressed - enabling trackpad instantly"
          enable_trackpad
          touch "$CANCEL_TIMEOUT"
          continue 2 # Continue outer loop
        fi
      done

      # Check if any modifier is held + key pressed (modifier chord)
      if $CTRL_HELD || $ALT_HELD || $SHIFT_HELD || $SUPER_HELD; then
        echo "Modifier chord detected: $hypr_key - enabling trackpad"
        enable_trackpad
        touch "$CANCEL_TIMEOUT"
        continue
      fi

      # Check if this is a focus movement binding ONLY when modifiers are held
      # (Focus movement requires modifier combinations, not plain key presses)
      if $CTRL_HELD || $ALT_HELD || $SHIFT_HELD || $SUPER_HELD; then
        if is_focus_binding "$hypr_key" || is_focus_binding "$(echo "$hypr_key" | tr '[:upper:]' '[:lower:]')"; then
          echo "Focus movement binding detected: $hypr_key - enabling trackpad"
          enable_trackpad
          # Cancel any running timeout
          touch "$CANCEL_TIMEOUT"
          continue
        fi
      fi
    fi

    echo "Key pressed - disabling trackpad"
    disable_trackpad

    # Clean up any existing cancel signal and kill existing timeout
    rm -f "$CANCEL_TIMEOUT"
    [ -f "$PID_FILE" ] && kill $(cat "$PID_FILE") 2>/dev/null

    # Start simple timeout with cancellation check
    (
      # dwt-timeout: Re-enable trackpad after typing timeout
      for i in {1..15}; do # 1.5 seconds in 0.1s increments
        sleep 0.1
        [ -f "$CANCEL_TIMEOUT" ] && {
          echo "Timeout cancelled"
          rm -f "$PID_FILE" "$CANCEL_TIMEOUT"
          exit 0
        }
      done
      echo "Re-enabling trackpad after timeout"
      enable_trackpad
      rm -f "$PID_FILE"
    ) &
    echo $! >"$PID_FILE"
  fi
done
