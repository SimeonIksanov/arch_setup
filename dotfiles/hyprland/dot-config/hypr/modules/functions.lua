local M = {}

local mainMod = "SUPER +"
local shiftMod = "SUPER + SHIFT +"
local ctrlMod = "SUPER + CTRL +"

function M.Super(key)
	return mainMod .. key
end
function M.SuperShift(key)
	return shiftMod .. key
end
function M.SuperCtrl(key)
	return ctrlMod .. key
end
function M.RunApp(app)
	return hl.dsp.exec_cmd("uwsm app -- " .. app)
end

function M.notify(msg)
	hl.notification.create({
		text = msg,
		time = 3000,
		font_size = 22,
		color = "rgb(ff0000)",
		icon = "info",
	})
end

function M.switch_layout()
	local layouts = { "scrolling", "dwindle", "master", "monocle" }
	local workspace = hl.get_active_workspace()
	if hl.get_active_special_workspace() then
		workspace = hl.get_active_special_workspace()
	end

	local next_layout = "dwindle"

	if not workspace then
		return
	end

	for i = 1, #layouts do
		if layouts[i] == workspace.tiled_layout then
			local next_layout_idx = (i % #layouts) + 1
			next_layout = layouts[next_layout_idx]
			break
		end
	end

	if workspace.special then
		hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
	else
		hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
	end
	M.notify("Current layout: " .. next_layout)
end
-- function M.switch_layout()
-- 	local current = hl.get_active_workspace().tiled_layout
-- 	local next_layout = ""
-- 	if current == "dwindle" then
-- 		next_layout = "master"
-- 	end
-- 	if current == "master" then
-- 		next_layout = "scrolling"
-- 	end
-- 	if current == "scrolling" then
-- 		next_layout = "monocle"
-- 	end
-- 	if current == "monocle" then
-- 		next_layout = "dwingle"
-- 	end
-- 	hl.config({ general = { layout = next_layout } })
-- 	M.notify("Current layout: " .. next_layout)
-- end

local touchpadFileName = "/tmp/touchpad_state"
local function getTouchpadId()
	return "gxtp5100:00-27c6:01e9-1"
end

local function setTouchPadState(state)
	local cmd = "hyprctl eval 'hl.dispatch(hl.device({name = \""
		.. getTouchpadId()
		.. '", enabled = '
		.. state
		.. "}))'"
	hl.exec_cmd(cmd)
end

local function touchpadWriteState(state)
	local f = io.open(touchpadFileName, "w+")
	if f == nil then
		error("Failed to open file " .. touchpadFileName, 1)
	end
	f:write(state)
	f:close()
end

function M.toggleTouchpad()
	local touchpad_enabled
	local f = io.open(touchpadFileName, "r")
	if not f then
		touchpad_enabled = true
	else
		local n = f:read("*n")
		touchpad_enabled = n == 1 and true or false
		f:close()
	end

	if touchpad_enabled then
		if pcall(touchpadWriteState, 0) then
			setTouchPadState("false")
			M.notify("Touchpad disabled")
		else
			M.notify("Failed to disable Touchpad")
		end
	else
		if pcall(touchpadWriteState, 1) then
			setTouchPadState("true")
			M.notify("Touchpad enabled")
		else
			M.notify("Failed to enable Touchpad")
		end
	end
end

return M
