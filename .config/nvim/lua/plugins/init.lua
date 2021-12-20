local packer = require('plugins.packer')
if not packer then return false end

return packer.startup(function()
  -- Packer self-management
  use { 'wbthomason/packer.nvim' }
  -- Color schemes
  use {
    'folke/tokyonight.nvim',
    config = function()
      vim.cmd 'colorscheme tokyonight'
    end
  }
  -- LSP Plugins
  use { 'neovim/nvim-lspconfig' }
  use { 'kabouzeid/nvim-lspinstall' }
  -- Completion Plugins
  use { 'hrsh7th/nvim-cmp' }          -- Completion engine
  use { 'hrsh7th/cmp-buffer' }        -- Buffer completions
  use { 'hrsh7th/cmp-path' }          -- Path completions
  use { 'hrsh7th/cmp-cmdline' }       -- Command line completions
  use { 'saadparwaiz1/cmp_luasnip' }  -- Snippet completions

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
