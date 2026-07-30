local lib = require("modules.functions")

hl.bind(lib.Super("Tab"), lib.switch_layout, { description = "Switch layout" })

--Swap scrolling culumns
-- hl.bind(lib.Super("bracketleft"), hl.dsp.layout("swapcol l"), { description = "swap collumn left" })
-- hl.bind(lib.Super("bracketright"), hl.dsp.layout("swapcol r"), { description = "swap collumn right" })
hl.bind(lib.SuperShift("minus"), hl.dsp.layout("colresize -conf"), { description = "resize collumn smaller" })
hl.bind(lib.SuperShift("equal"), hl.dsp.layout("colresize +conf"), { description = "resize collumn larger" })
hl.bind(
	lib.SuperShift("comma"),
	hl.dsp.layout("consume_or_expel prev"),
	{ description = "expel if not alone, consume if alone in a column prev" }
)
hl.bind(
	lib.SuperShift("period"),
	hl.dsp.layout("consume_or_expel next"),
	{ description = "expel if not alone, consume if alone in a column next" }
)

local function layout_bind(bind_table)
	return function()
		local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()

		if not workspace then
			return
		end

		local layout = workspace.tiled_layout

		if bind_table[layout] then
			hl.dispatch(bind_table[layout])
		end
	end
end

hl.bind(
	"SUPER + A",
	layout_bind({
		scrolling = hl.dsp.layout("swapcol l"), -- Scrolling: swap column with left one
		dwindle = hl.dsp.layout("swapsplit"), -- Dwindle: swap window split
		monocle = hl.dsp.layout("cycleprev"), -- Monocle and master: cycle prev window
		master = hl.dsp.layout("cycleprev"),
	})
)

hl.bind(
	"SUPER + D",
	layout_bind({
		scrolling = hl.dsp.layout("swapcol r"), -- Scrolling: swap column with right one
		dwindle = hl.dsp.layout("togglesplit"), -- Dwindle: toggle window split
		monocle = hl.dsp.layout("cyclenext"), -- Monocle and master: cycle next window
		master = hl.dsp.layout("cyclenext"),
	})
)
