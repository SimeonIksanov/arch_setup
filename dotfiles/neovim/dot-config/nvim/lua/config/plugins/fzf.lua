local fzf = require('fzf-lua')

fzf.setup({
  files = {
    cwd_prompt = false
  }
})
-- Use fzf-lua for vim.ui.select() (LSP lists, etc. — future-proof)
fzf.register_ui_select()

-- Pickers
local map = vim.keymap.set
map('n', '<leader>ff', function() fzf.files() end, { desc = 'Find files' })
map('n', '<leader>fb', function() fzf.buffers() end, { desc = 'Find buffers' })
map('n', '<leader>fk', function() fzf.keymaps() end, { desc = 'Find keymaps' })
map('n', '<leader>/', function() fzf.live_grep() end, { desc = 'Live grep' })
map('x', '<leader>/', function() fzf.grep_visual() end, { desc = 'Grep selection' })
map('n', '<leader><space>', function() fzf.builtin() end, { desc = 'Fzf-lua builtin pickers' })
map('n', '<leader>sh', function() fzf.help_tags() end, { desc = 'Search help tags' })
