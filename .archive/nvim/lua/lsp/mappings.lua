local M = {}

function M.setup(buffer)
  local map = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }

  map(buffer, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map(buffer, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map(buffer, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map(buffer, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map(buffer, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map(
    buffer, 'n', 'gl',
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
    opts)
end

return M
