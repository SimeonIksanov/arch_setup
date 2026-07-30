local lib = require("modules.functions")

hl.bind(
	"ALT + XF86AudioMute",
	lib.RunApp(
		"pactl set-source-mute 0 toggle "
			.. "&& swayosd-client "
			.. "--device alsa_input.pci-0000_00_1b.0.analog-stereo "
			.. "--input-volume mute-toggle"
	),
	{ locked = true, description = "Mute mic" }
)

hl.bind(
	"XF86AudioMicMute",
	lib.RunApp("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, description = "Mute mic" }
)
-- Laptop keyboard backlight
hl.bind(
	"XF86KbdBrightnessUp",
	lib.RunApp("brightnessctl -d smc::kbd_backlight set +10%"),
	{ locked = true, repeating = true, description = "Decrease keyboard brightness" }
)
hl.bind(
	"XF86KbdBrightnessDown",
	lib.RunApp("brightnessctl -d smc::kbd_backlight set +10%-"),
	{ locked = true, repeating = true, description = "Decrease keyboard brightness" }
)

-- Requires playerctl
hl.bind("XF86AudioNext", lib.RunApp("playerctl next"), { locked = true, description = "Play next" })
hl.bind("XF86AudioPause", lib.RunApp("playerctl play-pause"), { locked = true, description = "Play/Pause" })
hl.bind("XF86AudioPlay", lib.RunApp("playerctl play-pause"), { locked = true, description = "Play/Pause" })
hl.bind("XF86AudioPrev", lib.RunApp("playerctl previous"), { locked = true, description = "Play previous" })

hl.bind("XF86TouchpadToggle", lib.toggleTouchpad, { description = "Toggle touchpad" })

-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind(
--   "XF86AudioRaiseVolume",
--   RunApp("swayosd-client --output-volume +5"),
--   { locked = true, repeating = true, description = "Increase volume" }
-- )
-- hl.bind(
--   "ALT + XF86AudioRaiseVolume",
--   RunApp("swayosd-client --output-volume +1"),
--   { locked = true, repeating = true, description = "Increase volume" }
-- )

-- hl.bind(
-- 	"XF86AudioLowerVolume",
-- 	RunApp("swayosd-client --output-volume -5"),
-- 	{ locked = true, repeating = true, description = "Decrease volume" }
-- )
-- hl.bind(
-- 	"ALT + XF86AudioLowerVolume",
-- 	RunApp("swayosd-client --output-volume -1"),
-- 	{ locked = true, repeating = true, description = "Decrease volume" }
-- )

-- hl.bind("XF86AudioMute", RunApp("swayosd-client --output-volume mute-toggle"), { locked = true, description = "Mute" })

-- hl.bind(
-- 	"XF86MonBrightnessUp",
-- 	RunApp("swayosd-client --brightness +5"),
-- 	{ locked = true, repeating = true, description = "Increase display brightness" }
-- )
-- hl.bind(
-- 	"ALT + XF86MonBrightnessUp",
-- 	RunApp("swayosd-client --brightness +1"),
-- 	{ locked = true, repeating = true, description = "Increase display brightness" }
-- )
--
-- hl.bind(
-- 	"XF86MonBrightnessDown",
-- 	RunApp("swayosd-client --brightness -5"),
-- 	{ locked = true, repeating = true, description = "Decrease display brightness" }
-- )
-- hl.bind(
-- 	"ALT + XF86MonBrightnessDown",
-- 	RunApp("swayosd-client --brightness -1"),
-- 	{ locked = true, repeating = true, description = "Decrease display brightness" }
-- )
