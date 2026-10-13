-- Leader (must be set before any mapping and before plugins are loaded)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

-- Windows
map('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
map('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Window up' })
map('n', '<C-l>', '<C-w>l', { desc = 'Window right' })

-- Buffers
map('n', '<BS>', '<C-^>', { desc = 'Alternate buffer' })

-- Insert mode: leave without touching the home row
map('i', 'jj', '<Esc>', { desc = 'Exit insert mode' })
map('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })

-- Files / sessions
map('n', '<leader>w', '<cmd>write<cr>', { desc = 'Save file' })
map('n', '<leader>q', '<cmd>quit<cr>', { desc = 'Quit' })

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight' })
