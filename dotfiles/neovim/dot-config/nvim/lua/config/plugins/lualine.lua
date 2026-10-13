require('lualine').setup({
  options = {
    -- Flavor-specific theme shipped by the catppuccin plugin itself
    -- (lualine has no plain 'catppuccin' theme anymore).
    theme = 'catppuccin-mocha',
    icons_enabled = true, -- resolved via mini.icons (devicons mock)
  },
  sections = {
    lualine_b = {
      'branch',
      {
        'diff',
        -- Counts come from mini.diff (gitsigns is gone); empty when the
        -- buffer isn't diffed (e.g. not a git repo).
        source = function()
          local s = vim.b.minidiff_summary
          if not s then return { added = 0, modified = 0, removed = 0 } end
          return { added = s.add, modified = s.change, removed = s.delete }
        end,
      },
    },
  },
})
