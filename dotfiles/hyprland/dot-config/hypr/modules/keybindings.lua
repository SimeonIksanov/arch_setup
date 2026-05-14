local lib = require("modules.functions")
local mainMod = "SUPER"
hl.bind(mainMod .. "+ SHIFT + period", lib.switch_layout)
hl.bind(mainMod .. "+         T", hl.dsp.exec_cmd("uwsm app -- ghostty +new-window"), { description = "Open Ghostty" })
hl.bind(mainMod .. "+ SHIFT + B", hl.dsp.exec_cmd("uwsm app -- vivaldi"), { description = "Open Vivaldi" })
hl.bind(mainMod .. "+ Return   ", hl.dsp.exec_cmd("uwsm app -- rofi -show drun"), { description = "Open Rofi" })
hl.bind(mainMod .. "+         Q", hl.dsp.window.close(), { description = "Close window" })
-- hl.bind(mainMod .. "+ SHIFT + Q", hl.dsp.exit(), { description = "Exit Hyprland" })
hl.bind(mainMod .. "+ SHIFT + Q", hl.dsp.exec_cmd("uswm stop"), { description = "Exit Hyprland" })
hl.bind(mainMod .. "+         V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(mainMod .. "+         P", hl.dsp.window.pseudo(), { description = "Toggle pseudo" })
hl.bind(mainMod .. "+ SHIFT + J", hl.dsp.layout("togglesplit"), { description = "Toggle split" })
hl.bind(
	mainMod .. "+ F",
	hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
	{ description = "Toggle fullscreen" }
)
hl.bind(mainMod .. "+ N", hl.dsp.exec_cmd("uwsm app -- swaync-client -t -sw"), { description = "Toggle swaync-client" })
hl.bind(mainMod .. "+ Escape", hl.dsp.exec_cmd("uwsm app -- wlogout -s"), { description = "Open wlogout menu" })

for i = 1, 10, 1 do
	local key = i % 10
	local focusKeyBind = mainMod .. " + " .. key
	local moveKeyBind = mainMod .. " + SHIFT + " .. key
	local desc = "workspace " .. i
	hl.bind(focusKeyBind, hl.dsp.focus({ workspace = i }), { description = "Focus " .. desc })
	hl.bind(moveKeyBind, hl.dsp.window.move({ workspace = i }), { description = "Move window to " .. desc })
end

hl.bind(mainMod .. " + H", function()
	hl.dispatch(hl.dsp.focus({ direction = "left" }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(mainMod .. " + J", function()
	hl.dispatch(hl.dsp.focus({ direction = "down" }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(mainMod .. " + K", function()
	hl.dispatch(hl.dsp.focus({ direction = "up" }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(mainMod .. " + L", function()
	hl.dispatch(hl.dsp.focus({ direction = "right" }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)

hl.bind(mainMod .. "+ CTRL + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. "+ CTRL + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. "+ CTRL + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. "+ CTRL + L", hl.dsp.window.move({ direction = "right" }))

hl.bind(mainMod .. "+ S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. "+ SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("ALT+TAB", function()
	hl.dispatch(hl.dsp.window.cycle_next())
	hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind("ALT+SHIFT+TAB", function()
	hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)

hl.bind(mainMod .. "+DOWN", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "+UP", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. "+SHIFT+DOWN", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. "+SHIFT+UP", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. "+CTRL+RIGHT", hl.dsp.focus({ monitor = "+1" }))
hl.bind(mainMod .. "+CTRL+LEFT", hl.dsp.focus({ monitor = "-1" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. "+ mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. "+ mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. "+ mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch to a submap called `resize`.
hl.bind(mainMod .. "+ R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("l", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Switch to a submap called `move`.
hl.bind(mainMod .. "+ M", hl.dsp.submap("move"))

-- Start a submap called "move".
hl.define_submap("move", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("l", hl.dsp.window.move({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("h", hl.dsp.window.move({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("k", hl.dsp.window.move({ x = 0, y = -10, relative = true }), { repeating = true })
	hl.bind("j", hl.dsp.window.move({ x = 0, y = 10, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("uwsm app -- swayosd-client --output-volume +5"),
	{ locked = true, repeating = true, description = "Increase volume" }
)
hl.bind(
	"ALT + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("uwsm app -- swayosd-client --output-volume +1"),
	{ locked = true, repeating = true, description = "Increase volume" }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("uwsm app -- swayosd-client --output-volume -5"),
	{ locked = true, repeating = true, description = "Decrease volume" }
)
hl.bind(
	"ALT + XF86AudioLowerVolume",
	hl.dsp.exec_cmd("uwsm app -- swayosd-client --output-volume -1"),
	{ locked = true, repeating = true, description = "Decrease volume" }
)

hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("uwsm app -- swayosd-client --output-volume mute-toggle"),
	{ locked = true, description = "Mute" }
)
hl.bind(
	"ALT + XF86AudioMute",
	hl.dsp.exec_cmd(
		"uwsm app -- pactl set-source-mute 0 toggle && swayosd-client --device alsa_input.pci-0000_00_1b.0.analog-stereo --input-volume mute-toggle"
	),
	{ locked = true, description = "Mute mic" }
)

hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("uwsm app -- wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, description = "Mute mic" }
)

hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("uwsm app -- swayosd-client --brightness +5"),
	{ locked = true, repeating = true, description = "Increase display brightness" }
)
hl.bind(
	"ALT + XF86MonBrightnessUp",
	hl.dsp.exec_cmd("uwsm app -- swayosd-client --brightness +1"),
	{ locked = true, repeating = true, description = "Increase display brightness" }
)

hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("uwsm app -- swayosd-client --brightness -5"),
	{ locked = true, repeating = true, description = "Decrease display brightness" }
)
hl.bind(
	"ALT + XF86MonBrightnessDown",
	hl.dsp.exec_cmd("uwsm app -- swayosd-client --brightness -1"),
	{ locked = true, repeating = true, description = "Decrease display brightness" }
)

-- Laptop keyboard backlight
hl.bind(
	"XF86KbdBrightnessUp",
	hl.dsp.exec_cmd("uwsm app -- brightnessctl -d smc::kbd_backlight set +10%"),
	{ locked = true, repeating = true, description = "Decrease keyboard brightness" }
)
hl.bind(
	"XF86KbdBrightnessDown",
	hl.dsp.exec_cmd("uwsm app -- brightnessctl -d smc::kbd_backlight set +10%-"),
	{ locked = true, repeating = true, description = "Decrease keyboard brightness" }
)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("uwsm app -- playerctl next"), { locked = true, description = "Play next" })
hl.bind(
	"XF86AudioPause",
	hl.dsp.exec_cmd("uwsm app -- playerctl play-pause"),
	{ locked = true, description = "Play/Pause" }
)
hl.bind(
	"XF86AudioPlay",
	hl.dsp.exec_cmd("uwsm app -- playerctl play-pause"),
	{ locked = true, description = "Play/Pause" }
)
hl.bind(
	"XF86AudioPrev",
	hl.dsp.exec_cmd("uwsm app -- playerctl previous"),
	{ locked = true, description = "Play previous" }
)

-- Toggle touchpad
hl.bind(
	"XF86TouchpadToggle",
	hl.dsp.exec_cmd("/home/simeon/.config/hypr/scripts/toggle_touchpad.sh"),
	{ description = "Toggle touchpad" }
)
