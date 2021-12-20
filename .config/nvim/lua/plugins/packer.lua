local cmd = vim.cmd
local fn = vim.fn
local packer_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Automatically install packer
if fn.empty(fn.glob(packer_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '1',
    packer_path,
  })
  cmd 'packadd packer.nvim'
  print 'Installing packer... Please restart neovim.'
end

-- Check that packer was installed
local installed, packer = pcall(require, 'packer')
if not installed then
  error 'Unable to install packer at ' .. packer_path
end 

return packer
