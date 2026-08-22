local M = {}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

cmd = vim.cmd

vim.g.mapleader = ' '      -- Map leader to space
vim.g.maplocalleader = ',' -- Map local leader to comma

map('i', 'jj', '<Esc>', opts)  -- 'jj' to enter normal mode from insert mode

cmd 'ca tn tabnew'

M.nvimTree = function()
  map('n', '<C-n>', ':NvimTreeToggle <CR>', opts)
end

return M
