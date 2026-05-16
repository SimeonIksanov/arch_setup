hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("easeOutQuart", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.curve("easeOutBack", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } }) --modified
hl.curve("easeOut", { type = "bezier", points = { { 0.04, 0 }, { 0.2, 1 } } }) --modified
hl.curve("easeOutCirc", { type = "bezier", points = { { 0.0, 0.0 }, { 0.2, 1.0 } } }) --modified

-- Default springs
-- hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- hl.animation({ leaf = "global",              enabled = true,  speed = 50, bezier = "linear"})
hl.animation({ leaf = "windows", enabled = false, speed = 3, bezier = "easeOutBack", style = "slide" })
-- hl.animation({ leaf = "windowsIn",           enabled = true,  speed = 50, bezier = "linear", style="slide"})
-- hl.animation({ leaf = "windowsOut",          enabled = true, speed = 50, bezier = "linear", style="slide"})
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "easeOut", style = "slide" })
hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "easeOutCirc", style = "slide" })
-- hl.animation({ leaf = "layersIn",            enabled = true, speed = 50, bezier = "linear", style="slide"})
-- hl.animation({ leaf = "layersOut",           enabled = true, speed = 50, bezier = "linear", style="slide"})
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "easeOutQuart" })
-- hl.animation({ leaf = "fadeIn",              enabled = false, speed = 50, bezier = "linear"})
-- hl.animation({ leaf = "fadeOut",             enabled = false, speed = 50, bezier = "linear"})
hl.animation({ leaf = "fadeSwitch", enabled = false, speed = 50, bezier = "linear", style = "slide" })
hl.animation({ leaf = "fadeShadow", enabled = false, speed = 50, bezier = "linear", style = "slide" })
hl.animation({ leaf = "fadeDim", enabled = false, speed = 50, bezier = "linear", style = "slide" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 3, bezier = "easeOutCirc" })
-- hl.animation({ leaf = "fadeLayersIn",        enabled = false, speed = 50, bezier = "linear"})
-- hl.animation({ leaf = "fadeLayersOut",       enabled = false, speed = 50, bezier = "linear"})
hl.animation({ leaf = "fadePopups", enabled = true, speed = 2, bezier = "easeOutCirc" })
-- hl.animation({ leaf = "fadePopupsIn",        enabled = true, speed = 50, bezier = "linear"})
-- hl.animation({ leaf = "fadePopupsOut",       enabled = true, speed = 50, bezier = "linear"})
hl.animation({ leaf = "fadeDpms", enabled = true, speed = 50, bezier = "linear" })
-- hl.animation({ leaf = "border",              enabled = false, speed = 50, bezier = "linear", style="slide"})
-- hl.animation({ leaf = "borderangle",         enabled = false, speed = 50, bezier = "linear", style="slide"})
hl.animation({ leaf = "workspaces", enabled = true, speed = 10, bezier = "easeOutBack", style = "slidevert" })
-- hl.animation({ leaf = "workspacesIn",        enabled = true, speed = 50, bezier = "linear", style="slide"})
-- hl.animation({ leaf = "workspacesOut",       enabled = true, speed = 50, bezier = "linear", style="slide"})
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "linear", style = "fade" })
-- hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 50, bezier = "linear", style="slide"})
-- hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 50, bezier = "linear", style="slide"})
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 50, bezier = "linear" })
hl.animation({ leaf = "monitorAdded", enabled = false, speed = 50, bezier = "linear", style = "slide" })

-- hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
-- hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
-- hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
-- hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
-- hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
-- hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
-- hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
-- hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
-- hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
-- hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
