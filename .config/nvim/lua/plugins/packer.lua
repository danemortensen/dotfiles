local success, packer = pcall(require, 'packer')

if not success then
  local fn = vim.fn
  local packer_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  fn.delete(packer_path, 'rf')
  fn.system({
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '1',
    packer_path,
  })

  success, packer = pcall(require, 'packer')
  if not success then
    error('Unable to clone packer from ' .. packer_path)
  end
end

local cmd = vim.cmd
vim.cmd 'packadd packer.nvim'                        -- Required because packer is lazy-loaded
cmd 'autocmd BufWritePost init.lua PackerCompile' -- Compile upon changes to plugins.lua

return packer
