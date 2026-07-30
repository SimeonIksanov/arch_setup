hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
	master = {
		new_status = "master",
	},
	scrolling = {
		fullscreen_on_one_column = false,
		column_width = 0.66,
		focus_fit_method = 1,
		follow_focus = true,
		follow_min_visible = 0,
		explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
		wrap_focus = true,
		wrap_swapcol = true,
		direction = "right",
	},
	general = {
		layout = "scrolling",
	},
})
