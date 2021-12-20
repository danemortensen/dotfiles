local installed, _ = pcall(require, 'lspconfig')
if not installed then
  print('Unable to set up LSP support. Please install lspconfig first.')
  return
end

require('lsp.lsp-installer')
require('lsp.handlers').setup()
