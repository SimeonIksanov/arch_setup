local apps = {
	"noctalia",
}
hl.on("hyprland.start", function()
	for _, app in ipairs(apps) do
		hl.exec_cmd("uwsm app -- " .. app)
	end
end)

hl.workspace_rule({ workspace = "1", persistent = true })
hl.workspace_rule({ workspace = "2", persistent = true })
hl.workspace_rule({ workspace = "3", persistent = true })
hl.workspace_rule({ workspace = "4", persistent = true })
hl.workspace_rule({ workspace = "5", persistent = true })

local ipc = "noctalia msg "

-- Core binds
hl.bind("SUPER+Return", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
-- hl.bind(mainMod .. "+S", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
-- hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
hl.bind("SUPER + Escape", hl.dsp.exec_cmd(ipc .. "panel-open session"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up 1"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down 1"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up 1"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down 1"))

-- Noctalia Settings
hl.window_rule({
	match = { class = "dev.noctalia.Noctalia" },
	float = true,
	size = { 1080, 920 },
})

hl.layer_rule({
	name = "noctalia",
	match = {
		namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
	},
	no_anim = true,
	ignore_alpha = 0.5,
	blur = true,
	blur_popups = true,
})
