hl.window_rule({
	match = {
		title = "^(Save|Open|Export|Import|Choose|Rename|Select).+(File|Folder|As)?",
	},
	float = true,
	center = true,
})
hl.window_rule({
	match = {
		class = "^nm-connection-editor$",
	},
	float = true,
	center = true,
})

hl.layer_rule({
	match = { namespace = "swaync-control-center" },
	blur = true,
	ignore_alpha = 0.1,
	animation = "slide right",
})
hl.layer_rule({
	match = { namespace = "swaync-notification-window" },
	blur = true,
	ignore_alpha = 0.1,
	animation = "slide right",
})

hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
	ignore_alpha = 0.1,
	no_anim = true,
})

hl.layer_rule({
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0.5,
	-- animation = "popin 95%",
	animation = "popin 90%",
})
