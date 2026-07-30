local lib = require("modules.functions")

require("modules.keybindings_apps")
require("modules.keybindings_special")
require("modules.keybindings_layout")

-- hl.bind(Super("Return"), RunApp("rofi -show drun"), { description = "Open Rofi" })
-- hl.bind(Super("N"), RunApp("swaync-client -t -sw"), { description = "Toggle swaync-client" })
-- hl.bind(Super("Escape"), RunApp("wlogout -s"), { description = "Open wlogout menu" })
hl.bind(lib.Super("Q"), hl.dsp.window.close(), { description = "Close window" })
hl.bind(lib.Super("V"), hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(lib.Super("P"), hl.dsp.window.pseudo(), { description = "Toggle pseudo" })
hl.bind(
	lib.Super("F"),
	hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }),
	{ description = "Toggle fullscreen" }
)
hl.bind(
	lib.SuperShift("F"),
	hl.dsp.window.fullscreen_state({ internal = 2, client = 0 }),
	{ description = "Toggle maximized" }
)
hl.bind(lib.SuperShift("Q"), hl.dsp.window.kill(), { description = "Kill process" })
hl.bind(lib.SuperCtrl("SHIFT+Q"), hl.dsp.exec_cmd("uswm stop"), { description = "Exit Hyprland" })

for i = 1, 10, 1 do
	local key = i % 10
	local desc = "workspace " .. i
	hl.bind(lib.Super(key), hl.dsp.focus({ workspace = i }), { description = "Focus " .. desc })
	hl.bind(lib.SuperShift(key), hl.dsp.window.move({ workspace = i }), { description = "Move window to " .. desc })
end

hl.bind(lib.Super("H"), function()
	hl.dispatch(hl.dsp.focus({ direction = "left" }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(lib.Super("J"), function()
	hl.dispatch(hl.dsp.focus({ direction = "down" }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(lib.Super("K"), function()
	hl.dispatch(hl.dsp.focus({ direction = "up" }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(lib.Super("L"), function()
	hl.dispatch(hl.dsp.focus({ direction = "right" }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)

hl.bind(lib.SuperCtrl("H"), hl.dsp.window.move({ direction = "left" }))
hl.bind(lib.SuperCtrl("J"), hl.dsp.window.move({ direction = "down" }))
hl.bind(lib.SuperCtrl("K"), hl.dsp.window.move({ direction = "up" }))
hl.bind(lib.SuperCtrl("L"), hl.dsp.window.move({ direction = "right" }))

hl.bind(lib.Super("S"), hl.dsp.workspace.toggle_special("magic"))
hl.bind(lib.SuperShift("S"), hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind("ALT+TAB", function()
	hl.dispatch(hl.dsp.window.cycle_next())
	hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind("ALT+SHIFT+TAB", function()
	hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
	hl.dispatch(hl.dsp.window.bring_to_top())
end)

hl.bind(lib.Super("DOWN"), hl.dsp.focus({ workspace = "m+1" }))
hl.bind(lib.Super("UP"), hl.dsp.focus({ workspace = "m-1" }))
hl.bind(lib.SuperShift("DOWN"), hl.dsp.focus({ workspace = "r+1" }))
hl.bind(lib.SuperShift("UP"), hl.dsp.focus({ workspace = "r-1" }))
hl.bind(lib.SuperCtrl("RIGHT"), hl.dsp.focus({ monitor = "+1" }))
hl.bind(lib.SuperCtrl("LEFT"), hl.dsp.focus({ monitor = "-1" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(lib.Super("mouse_down"), hl.dsp.focus({ workspace = "m+1" }))
hl.bind(lib.Super("mouse_up"), hl.dsp.focus({ workspace = "m-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(lib.Super("mouse:272"), hl.dsp.window.drag(), { mouse = true })
hl.bind(lib.Super("mouse:273"), hl.dsp.window.resize(), { mouse = true })

-- Switch to a submap called `resize`.
hl.bind(lib.Super("R"), hl.dsp.submap("resize"))
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
hl.bind(lib.Super("M"), hl.dsp.submap("move"))
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
