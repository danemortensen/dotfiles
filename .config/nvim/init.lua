local cmd = vim.cmd

cmd 'filetype plugin indent on'

-- require('settings')

require('plugins')  -- plugin-related code
require('mappings') -- leader, key mappings, and aliases
require('options')

cmd 'colorscheme tokyonight'
-- require('nord').set()
