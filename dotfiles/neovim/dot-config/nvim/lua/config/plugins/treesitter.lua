-- nvim-treesitter `main` branch API (Neovim 0.12 rewrite):
-- no `ensure_installed`, no modules; highlighting is NOT auto-enabled.
local ts = require('nvim-treesitter')

ts.setup({})

-- Parsers are compiled asynchronously in the background on first start.
ts.install({
  'lua',
  'vim',
  'vimdoc',
  'json',
  'yaml',
  'markdown',
  'markdown_inline',
  'javascript',
  'typescript',
  'tsx',
  'html',
  'css',
  'bash',
  'python',
  'gitcommit',
  'gitignore',
  'regex',
  'query',
})

-- Enable treesitter highlighting per buffer (no parser -> pcall skips it)
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('TreesitterHighlight', { clear = true }),
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})

-- Re-generate parsers/queries when the plugin itself is updated, so an
-- update can't leave us with broken queries against old parsers.
vim.api.nvim_create_autocmd('PackChanged', {
  group = vim.api.nvim_create_augroup('TreesitterPackChanged', { clear = true }),
  callback = function(ev)
    local name = ev.data and ev.data.spec and ev.data.spec.name
    if name == 'nvim-treesitter' and ev.data.kind == 'update' then
      pcall(vim.cmd, 'TSUpdate')
    end
  end,
})
