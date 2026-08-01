local apps = {
	"waybar",
	"hyprpaper",
	"hypridle",
	"hyprsunset",
	"swaync",
	"swayosd-server",
	"udiskie -t",
}
hl.on("hyprland.start", function()
	for _, app in ipairs(apps) do
		hl.exec_cmd("uwsm app -- " .. app)
	end
end)
-- hl.on("hyprland.start", function()
-- 	hl.exec_cmd("uwsm app -- waybar")
-- 	hl.exec_cmd("uwsm app -- hyprpaper")
-- 	hl.exec_cmd("uwsm app -- hypridle")
-- 	hl.exec_cmd("uwsm app -- hyprsunset")
-- 	hl.exec_cmd("uwsm app -- swaync")
-- 	hl.exec_cmd("uwsm app -- swayosd-server")
-- end)
