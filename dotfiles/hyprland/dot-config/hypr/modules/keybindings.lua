local lib = require("modules.functions")
local mainMod = "SUPER +"
local shiftMod = "SUPER + SHIFT +"
local ctrlMod = "SUPER + CTRL +"

function Super(key)
  return mainMod .. key
end
function SuperShift(key)
  return shiftMod .. key
end
function SuperCtrl(key)
  return ctrlMod .. key
end
function RunApp(app)
  return hl.dsp.exec_cmd("uwsm app -- "..app)
end

hl.bind(
  SuperShift("period"),
  lib.switch_layout,
  { description = "Switch layout" }
)
hl.bind(Super("T"), 		RunApp("ghostty +new-window"), { description = "Open Ghostty" })
hl.bind(SuperShift("B"), 	RunApp("vivaldi"), { description = "Open Vivaldi" })
hl.bind(Super("Return"), 	RunApp("rofi -show drun"), { description = "Open Rofi" })
hl.bind(Super("N"), 		RunApp("swaync-client -t -sw"), { description = "Toggle swaync-client" })
hl.bind(Super("Escape"), 	RunApp("wlogout -s"), { description = "Open wlogout menu" })
hl.bind(Super("Q"), 		hl.dsp.window.close(), { description = "Close window" })
hl.bind(Super("V"), 		hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(Super("P"), 		hl.dsp.window.pseudo(), { description = "Toggle pseudo" })
hl.bind(Super("F"), 		hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Toggle fullscreen" })
-- hl.bind(SuperShift("F"),	hl.dsp.window.fullscreen_state({ internal = 2, client = 0}), { description = "Toggle maximized" })
hl.bind(SuperShift("J"), 	hl.dsp.layout("togglesplit"), { description = "Toggle split" })
hl.bind(SuperShift("Q"), 	hl.dsp.window.kill(), { description = "Kill process" })
hl.bind(SuperCtrl("SHIFT+Q"), 	hl.dsp.exec_cmd("uswm stop"), { description = "Exit Hyprland" })

for i = 1, 10, 1 do
  local key = i % 10
  local desc = "workspace " .. i
  hl.bind(Super(key), hl.dsp.focus({ workspace = i }), { description = "Focus " .. desc })
  hl.bind(SuperShift(key), hl.dsp.window.move({ workspace = i }), { description = "Move window to " .. desc })
end

hl.bind(Super("H"), function()
  hl.dispatch(hl.dsp.focus({ direction = "left" }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(Super("J"), function()
  hl.dispatch(hl.dsp.focus({ direction = "down" }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(Super("K"), function()
  hl.dispatch(hl.dsp.focus({ direction = "up" }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(Super("L"), function()
  hl.dispatch(hl.dsp.focus({ direction = "right" }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)

hl.bind(SuperCtrl("H"), hl.dsp.window.move({ direction = "left" }))
hl.bind(SuperCtrl("J"), hl.dsp.window.move({ direction = "down" }))
hl.bind(SuperCtrl("K"), hl.dsp.window.move({ direction = "up" }))
hl.bind(SuperCtrl("L"), hl.dsp.window.move({ direction = "right" }))

hl.bind(Super("S"), hl.dsp.workspace.toggle_special("magic"))
hl.bind(SuperShift("S"), hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("ALT+TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind("ALT+SHIFT+TAB", function()
  hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)

hl.bind(Super("DOWN"), 		hl.dsp.focus({ workspace = "m+1" }))
hl.bind(Super("UP"), 		hl.dsp.focus({ workspace = "m-1" }))
hl.bind(SuperShift("DOWN"), 	hl.dsp.focus({ workspace = "r+1" }))
hl.bind(SuperShift("UP"), 	hl.dsp.focus({ workspace = "r-1" }))
hl.bind(SuperCtrl("RIGHT"), 	hl.dsp.focus({ monitor = "+1" }))
hl.bind(SuperCtrl("LEFT"), 	hl.dsp.focus({ monitor = "-1" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(Super("mouse_down"), 	hl.dsp.focus({ workspace = "m+1" }))
hl.bind(Super("mouse_up"), 	hl.dsp.focus({ workspace = "m-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(Super("mouse:272"), 	hl.dsp.window.drag(), { mouse = true })
hl.bind(Super("mouse:273"), 	hl.dsp.window.resize(), { mouse = true })

-- Switch to a submap called `resize`.
hl.bind(Super("R"), hl.dsp.submap("resize"))
-- Start a submap called "resize".
hl.define_submap("resize", function()
  -- Set repeating binds for resizing the active window.
  hl.bind("l", hl.dsp.window.resize({ x = 10, 	y = 0,		relative = true }), { repeating = true })
  hl.bind("h", hl.dsp.window.resize({ x = -10, 	y = 0, 		relative = true }), { repeating = true })
  hl.bind("k", hl.dsp.window.resize({ x = 0, 	y = -10, 	relative = true }), { repeating = true })
  hl.bind("j", hl.dsp.window.resize({ x = 0, 	y = 10, 	relative = true }), { repeating = true })
  -- Use `reset` to go back to the global submap
  hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Switch to a submap called `move`.
hl.bind(Super("M"), hl.dsp.submap("move"))
-- Start a submap called "move".
hl.define_submap("move", function()
  -- Set repeating binds for resizing the active window.
  hl.bind("l", hl.dsp.window.move({ x = 10, 	y = 0, 		relative = true }), { repeating = true })
  hl.bind("h", hl.dsp.window.move({ x = -10, 	y = 0, 		relative = true }), { repeating = true })
  hl.bind("k", hl.dsp.window.move({ x = 0, 	y = -10, 	relative = true }), { repeating = true })
  hl.bind("j", hl.dsp.window.move({ x = 0, 	y = 10, 	relative = true }), { repeating = true })
  -- Use `reset` to go back to the global submap
  hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
  "XF86AudioRaiseVolume",
  RunApp("swayosd-client --output-volume +5"),
  { locked = true, repeating = true, description = "Increase volume" }
)
hl.bind(
  "ALT + XF86AudioRaiseVolume",
  RunApp("swayosd-client --output-volume +1"),
  { locked = true, repeating = true, description = "Increase volume" }
)

hl.bind(
  "XF86AudioLowerVolume",
  RunApp("swayosd-client --output-volume -5"),
  { locked = true, repeating = true, description = "Decrease volume" }
)
hl.bind(
  "ALT + XF86AudioLowerVolume",
  RunApp("swayosd-client --output-volume -1"),
  { locked = true, repeating = true, description = "Decrease volume" }
)

hl.bind(
  "XF86AudioMute",
  RunApp("swayosd-client --output-volume mute-toggle"),
  { locked = true, description = "Mute" }
)
hl.bind(
  "ALT + XF86AudioMute",
  RunApp(
    "pactl set-source-mute 0 toggle "
    .. "&& swayosd-client "
    .. "--device alsa_input.pci-0000_00_1b.0.analog-stereo "
    .. "--input-volume mute-toggle"
  ),
  { locked = true, description = "Mute mic" }
)

hl.bind(
  "XF86AudioMicMute",
  RunApp("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, description = "Mute mic" }
)

hl.bind(
  "XF86MonBrightnessUp",
  RunApp("swayosd-client --brightness +5"),
  { locked = true, repeating = true, description = "Increase display brightness" }
)
hl.bind(
  "ALT + XF86MonBrightnessUp",
  RunApp("swayosd-client --brightness +1"),
  { locked = true, repeating = true, description = "Increase display brightness" }
)

hl.bind(
  "XF86MonBrightnessDown",
  RunApp("swayosd-client --brightness -5"),
  { locked = true, repeating = true, description = "Decrease display brightness" }
)
hl.bind(
  "ALT + XF86MonBrightnessDown",
  RunApp("swayosd-client --brightness -1"),
  { locked = true, repeating = true, description = "Decrease display brightness" }
)

-- Laptop keyboard backlight
hl.bind(
  "XF86KbdBrightnessUp",
  RunApp("brightnessctl -d smc::kbd_backlight set +10%"),
  { locked = true, repeating = true, description = "Decrease keyboard brightness" }
)
hl.bind(
  "XF86KbdBrightnessDown",
  RunApp("brightnessctl -d smc::kbd_backlight set +10%-"),
  { locked = true, repeating = true, description = "Decrease keyboard brightness" }
)

-- Requires playerctl
hl.bind(
  "XF86AudioNext",
  RunApp("playerctl next"),
  { locked = true, description = "Play next" }
)
hl.bind(
  "XF86AudioPause",
  RunApp("playerctl play-pause"),
  { locked = true, description = "Play/Pause" }
)
hl.bind(
  "XF86AudioPlay",
  RunApp("playerctl play-pause"),
  { locked = true, description = "Play/Pause" }
)
hl.bind(
  "XF86AudioPrev",
  RunApp("playerctl previous"),
  { locked = true, description = "Play previous" }
)

-- Toggle touchpad
hl.bind(
  "XF86TouchpadToggle",
  hl.dsp.exec_cmd("/home/simeon/.config/hypr/scripts/toggle_touchpad.sh"),
  { description = "Toggle touchpad" }
)
