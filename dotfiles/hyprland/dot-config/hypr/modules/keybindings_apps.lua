local lib = require("modules.functions")

-- hl.bind(lib.Super("T"), lib.RunApp("ghostty +new-window"), { description = "Open Ghostty" })
hl.bind(lib.Super("T"), lib.RunApp("kitty"), { description = "Open Kitty" })
hl.bind(lib.SuperShift("B"), lib.RunApp("vivaldi"), { description = "Open Vivaldi" })
