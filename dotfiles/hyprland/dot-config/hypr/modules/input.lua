hl.config({
	input = {
		kb_layout = "us, ru",
		kb_variant = "",
		kb_model = "",
		kb_options = "grp:win_space_toggle, caps:escape",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.2,
			disable_while_typing = true,
		},
	},
	gestures = {
		workspace_swipe_invert = false,
		workspace_swipe_distance = 200,
	},
})

hl.gesture({
	fingers = 3,
	direction = "swipe",
	action = "move",
})

hl.gesture({
	fingers = 4,
	direction = "vertical",
	action = "workspace",
})

hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "scroll_move",
})

hl.device({
	name = "logitech-wireless-mouse-1",
	sensitivity = -0.5,
})

hl.device({
	-- touchpad
	name = "gxtp5100:00-27c6:01e9-1",
	accel_profile = "adaptive",
	sensitivity = 0.3,
	enabled = true,
})
