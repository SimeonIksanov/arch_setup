-- mini.nvim is the full library; modules only load when required.
-- We use mini.pairs for autopairs (insert-mode pairs, smart <BS>, <CR>
-- inside pair — `modes`/`mappings` to tweak).
require('mini.pairs').setup({})

-- Icons for lualine/fyler without an 8th plugin (nvim-web-devicons mock).
require('mini.icons').setup()
require('mini.icons').mock_nvim_web_devicons()
-- Git diffs replace gitsigns.nvim (defaults otherwise): Git index as
-- reference, `gh` stage/apply + hunk textobject, `gH` reset hunk,
-- `]h`/`[h` next/prev hunk, `]H`/`[H` last/first hunk.
local diff = require('mini.diff')
diff.setup({
  view = {
    style = 'sign',
    signs = {
     add = '┃',
     change = '┃',
     delete = '_'
   },
  }, -- markers in sign column, not the number column
})
require('mini.jump2d').setup()

-- Git hunk maps on top of the defaults above:
--   <leader>hs stage hunk   <leader>hp preview overlay   <leader>hr reset
local map = vim.keymap.set
map('n', '<leader>hs', function() return diff.operator('apply') .. 'gh' end, { expr = true, remap = true, desc = 'Stage hunk' })
map('n', '<leader>hp', function() diff.toggle_overlay() end, { desc = 'Preview hunk (overlay)' })
-- Reset = discard uncommitted edits: replace changed lines with Git index text.
-- Normal mode appends the `gh` hunk textobject (needs remap); visual mode's
-- `g@` acts directly on the selection.
map('n', '<leader>hr', function() return diff.operator('reset') .. 'gh' end, { expr = true, remap = true, desc = 'Reset hunk' })
map('x', '<leader>hr', function() return diff.operator('reset') end, { expr = true, desc = 'Reset selection' })
