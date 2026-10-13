-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.cmd("language en_US.UTF-8")
vim.opt.winborder = "single"
vim.opt.mouse = ""
vim.opt.clipboard = ""
vim.opt.wrap = false
vim.opt.timeoutlen = 600
vim.opt.colorcolumn = "100"
vim.opt.listchars = {
  extends = "…",
  precedes = "…",
  nbsp = "␣",
  tab = "» ",
  -- multispace = "·",
  trail = "·",
}
