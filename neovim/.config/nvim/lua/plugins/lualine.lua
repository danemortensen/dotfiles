return {
  'nvim-lualine/lualine.nvim',
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },  TODO: Set up nerd font.
  config = function()
    require("lualine").setup({
      options = { theme = "catppuccin" }
    })
  end,
}
