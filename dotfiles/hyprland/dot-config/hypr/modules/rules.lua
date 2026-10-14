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

hl.window_rule({
	name = "kitty_no_client_maximize",
	match = { class = "^(kitty)$" },
	suppress_event = "maximize",
})
