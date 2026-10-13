local opt = vim.opt

-- Line numbers: hybrid — cursor line shows the absolute number, the rest are
-- relative. (Pure relative: set 'relativenumber' alone and drop 'number'.)
opt.number = true
opt.relativenumber = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.cursorline = true

-- Search: case-insensitive unless the pattern has an uppercase letter
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Persistence and responsiveness
opt.undofile = true -- undo survives across sessions
opt.updatetime = 250

-- Splits
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 6

-- Indentation: change `indent` to re-indent the whole config
local indent = 2
opt.tabstop = indent
opt.shiftwidth = indent
opt.softtabstop = indent
opt.expandtab = true
opt.autoindent = true
