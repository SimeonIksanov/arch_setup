-- The single vim.pack.add() call for the whole config (:h vim.pack).
-- On first start it clones all repos in parallel into
-- ~/.local/share/nvim/site/pack/core/opt and writes nvim-pack-lock.json
-- into this config directory (put it under version control afterwards).
vim.pack.add({
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
  'https://github.com/nvim-treesitter/nvim-treesitter', -- `main` branch (0.12 rewrite)
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-mini/mini.nvim', -- mini.pairs + mini.icons + mini.diff
  'https://github.com/FylerOrg/fyler.nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
})

require('config.plugins.colorscheme')
require('config.plugins.treesitter')
require('config.plugins.fzf')
require('config.plugins.mini')
require('config.plugins.fyler')
require('config.plugins.lualine')
