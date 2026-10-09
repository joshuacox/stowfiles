-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

hl.config({
	input = {
		-- Keyboard layout and options.
		kb_layout = "us",
		kb_options = "compose:caps",

		-- Change speed of keyboard repeat.
		repeat_rate = 40,
		repeat_delay = 250,

		-- Start with numlock on by default.
		numlock_by_default = true,

		-- Follow mouse interaction setting
		follow_mouse = 1,

		touchpad = {
			-- Use natural (inverse) scrolling.
			natural_scroll = true,

			-- Use two-finger clicks for right-click instead of lower-right corner.
			clickfinger_behavior = false,

			-- Control the speed of your scrolling.
			scroll_factor = 0.4,

			-- Tap to click activation
			tap_to_click = true,

			-- Enable/Disable the touchpad while typing.
			disable_while_typing = true,
		},
	},
})

-- Cursor handling overrides
hl.config({
	cursor = {
		no_hardware_cursors = true,
	},
})

-- Personal device configuration overrides
-- Note: Multi-instance device adjustments use hl.device block definitions

hl.device({
	name = "lenovo-350-bluetooth-silent-mouse",
	left_handed = true,
})

hl.device({
	name = "lenovo-ms-mouse",
	left_handed = true,
})

hl.device({
	name = "pixart-cyberpower-opticalmouse",
	left_handed = true,
})

hl.device({
	name = "kensington-eagle-trackball",
	left_handed = true,
})

-- =========================================================================
-- Commented Out Configurations & Legacy Adjustments (Preserved from original)
-- =========================================================================

-- hl.device({
-- 	name = "elan0542:00-04f3:3368-mouse",
-- 	enabled = false,
-- })

-- hl.device({
-- 	name = "elan0542:00-04f3:3368-touchpad",
-- 	enabled = true,
-- 	accel_profile = "adaptive",
-- 	sensitivity = 0.35,
-- })

-- Force-inject the working bracket commands into the compositor startup sequence
-- exec-once = hyprctl keyword "device[elan0542:00-04f3:3368-mouse]:enabled" false
-- exec-once = hyprctl keyword "device[elan0542:00-04f3:3368-touchpad]:enabled" true
-- exec-once = hyprctl keyword "device[elan0542:00-04f3:3368-touchpad]:sensitivity" 0.35
