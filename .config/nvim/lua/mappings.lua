local M = {}

local map = require('utils').map

cmd = vim.cmd

vim.g.mapleader = ' '      -- Map leader to space
vim.g.maplocalleader = ',' -- Map local leader to comma


map('i', 'jj', '<Esc>') -- jj to escape in insert mode

cmd 'ca tn tabnew'

M.nvimTree = function()
  map('n', '<C-n>', ':NvimTreeToggle <CR>')
end

return M
