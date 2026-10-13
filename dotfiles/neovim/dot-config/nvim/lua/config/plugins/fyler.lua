local fyler = require('fyler')

fyler.setup({
  kind = "replace",
  integrations = {
    icon = 'mini_icons'
  }
})

-- Opened with <leader>e -> fyler.open({ kind = 'split_left_most' })
-- or :Fyler / :FylerOpen
vim.keymap.set('n', '<leader>e', function() fyler.open({ kind = 'replace' }) end, { desc = 'File manager' })
