local installed, installer = pcall(require, 'nvim-lsp-installer')
if not installed then
  print('Unable to configure nvim-lsp-installer. Please install it first.')
  return
end

installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('lsp.handlers').on_attach,
    capabilities = require('lsp.handlers').capabilities
  }

  local ok, server_opts = pcall(require, 'lsp.settings.' .. server.name)
  if ok then
    opts = vim.tbl_deep_extend('force', server_opts, opts)
  end

  server:setup(opts)
end)
