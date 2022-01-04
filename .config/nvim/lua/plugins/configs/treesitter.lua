local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua' },     -- Install parsers with maintainers
    sync_install = false,             -- Install languages asynchronously
    highlight = { enable = true },    -- Enable Treesitter highlighting
    indent = { enable = true },       -- Enable Treesitter indenting
  })
end

return M
