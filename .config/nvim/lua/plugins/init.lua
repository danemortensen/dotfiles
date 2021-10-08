local present, packer = pcall(require, 'plugins.packer')
if not present then
  return false
end

return require('packer').startup(function()
  use {
    'neovim/nvim-lspconfig'
  }

  use {
    'kabouzeid/nvim-lspinstall'
  }

  use {
    'wbthomason/packer.nvim',
    event = 'VimEnter',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    run = ':TSUpdate',
  }

  use {
    "kyazdani42/nvim-tree.lua",
    cmd = {"NvimTreeToggle", "NvimTreeFocus"},
    requires = 'kyazdani42/nvim-web-devicons',
    setup = function()
       require("mappings").nvimTree()
    end,
  }

  use {
    'b3nj5m1n/kommentary'
  }

  -- Color Schemes:
  use {
    'folke/tokyonight.nvim'
  }
  -- use {'shaunsingh/nord.nvim'}

  -- Use for lua keymap/ftplugin until the following merges:
  -- https://github.com/neovim/neovim/pull/13823 merges
  use {
    'tjdevries/astronauta.nvim'
  }
end)
