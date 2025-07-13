return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true,
      term_colors = true,
      -- Optionally make floating windows transparent
      float = { transparent = true },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
    end,
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = {
  --     sections = {
  --       lualine_c = {
  --         LazyVim.lualine.root_dir(),
  --         { "diagnostics" },
  --         { "filetype" },
  --         { LazyVim.lualine.pretty_path({ modified_sign  = " ●" }) },
  --       },
  --     },
  --     inactive_sessions = {},
  --   },
  -- },
}
