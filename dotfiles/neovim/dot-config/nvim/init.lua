-- Neovim config. Design decisions and rationale: see PLAN.md.
vim.loader.enable()

require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.plugins') -- single vim.pack.add() + per-plugin setup

-- Applied last so every plugin is on 'runtimepath' first.
vim.cmd.colorscheme('catppuccin')
