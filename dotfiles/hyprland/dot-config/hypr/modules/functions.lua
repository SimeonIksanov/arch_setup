local M = {}
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
	local current = hl.get_active_workspace().tiled_layout
	local next_layout = ""
	if current == "dwindle" then
		next_layout = "master"
	end
	if current == "master" then
		next_layout = "scrolling"
	end
	if current == "scrolling" then
		next_layout = "monocle"
	end
	if current == "monocle" then
		next_layout = "dwingle"
	end
	hl.config({ general = { layout = next_layout } })
	M.notify("Current layout: " .. next_layout)
end

return M
