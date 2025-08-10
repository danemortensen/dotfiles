return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "rust",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>")
  end,
}
