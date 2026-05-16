-- # Apple MacBook Pro Late 2013 13-inch: 1680x1050, 1440x900, or 1024x640.
-- # monitor = desc:Apple Computer Inc Color LCD,2560x1600@60,auto,1
-- # monitor = desc:Apple Computer Inc Color LCD,2048x1280@60,auto,1
-- # monitor = desc:Apple Computer Inc Color LCD,1920x1200@60,auto,1
-- monitor = desc:Apple Computer Inc Color LCD,1680x1050@60,auto,1
-- # monitor = desc:Apple Computer Inc Color LCD,1440x900@60,auto,1
-- # monitor = desc:Apple Computer Inc Color LCD,1280x800@60,auto,1
-- # monitor = desc:Apple Computer Inc Color LCD,1024x640@60,auto,1
--
-- # Lenovo ThinkBook 14G6+
-- # monitor = desc:Lenovo Group Limited 0x8AB1,3072x1920@120,auto,1
-- # monitor = desc:Lenovo Group Limited 0x8AB1,2560x1600@120,auto,1
-- # monitor = desc:Lenovo Group Limited 0x8AB1,2048x1280@120,auto,1
-- monitor = desc:Lenovo Group Limited 0x8AB1,1920x1200@120,auto,1
--
-- # AOC U2790B at home
-- # monitor = desc:AOC U2790B VGJP1HA001851,3840x2160@60,auto-center-right,1.25
-- monitor = desc:AOC U2790B VGJP1HA001851,3072x1728@60,auto-center-right,1
--
-- monitor = ,preferred,auto,1

hl.monitor({
	output = "desc:Lenovo Group Limited 0x8AB1",
	disabled = false,
	mode = "1920x1200@120",
	position = "auto",
	scale = "1",
})

hl.monitor({
	output = "desc:Apple Computer Inc Color LCD",
	disabled = false,
	mode = "1680x1050@60",
	position = "auto",
	scale = "1",
})

hl.monitor({
	output = "AOC U2790B VGJP1HA001851",
	disabled = false,
	mode = "3072x1728@60",
	position = "auto-center-right",
	scale = "1",
})

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "1" })
