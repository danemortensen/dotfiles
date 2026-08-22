local packer = require('plugins.packer')
if not packer then return false end

return packer.startup(function(use)
  -- PLUGIN MANAGER --
  use { 'wbthomason/packer.nvim' }  -- Packer self-management
  -- COLOR SCHEMES --
  use {
    'folke/tokyonight.nvim',
    config = function() vim.cmd 'colorscheme tokyonight' end
  }
  -- LSP PLUGINS --
  use { 'neovim/nvim-lspconfig' }            -- Enable LSP support
  use { 'williamboman/nvim-lsp-installer' }  -- Language server installer
  use { 'tamago324/nlsp-settings.nvim' }     -- Configure language servers
  -- COMPLETION PLUGINS --
  use { 'hrsh7th/nvim-cmp' }          -- Completion engine
  use { 'hrsh7th/cmp-buffer' }        -- Buffer completions
  use { 'hrsh7th/cmp-path' }          -- Path completions
  use { 'hrsh7th/cmp-cmdline' }       -- Command line completions
  use { 'saadparwaiz1/cmp_luasnip' }  -- Snippet completions
  use { 'hrsh7th/cmp-nvim-lsp' }      -- LSP completions
  use { 'L3MON4D3/LuaSnip' }          -- Snippet engine
  -- TREESITTER --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',                  -- Automatically update parsers
    config = function() require('plugins.configs.treesitter').setup() end,
  }
  -- AUTO-PAIRS --
  use {
    'windwp/nvim-autopairs',
    config = function() require('plugins.configs.autopairs').setup() end,
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

  -- Use for lua keymap/ftplugin until the following merges:
  -- https://github.com/neovim/neovim/pull/13823 merges
  use {
    'tjdevries/astronauta.nvim'
  }
end)
