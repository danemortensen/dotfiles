local M = {}

local lsp = vim.lsp
local handlers = lsp.handlers

function M.setup()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name,
                       { texthl = sign.name, text = sign.text, numhl = '' })
  end

  vim.diagnostic.config({
    float = { style = 'minimal' },
    signs = { active = signs },
    underline = true,
    virtual_text = false,
  })

  handlers['testDocument/hover'] = lsp.with(handlers.hover)
  handlers['textDocument/signatureHelp'] = lsp.with(handlers.signature_help)
end

function M.on_attach(buffer)
  require('lsp.mappings').setup(buffer)
end

local capabilities = lsp.protocol.make_client_capabilities()
local installed, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if installed then
  capabilities = cmp_lsp.update_capabilities(capabilities)
else
  print('Please install cmp_nvim_lsp.')
end
M.capabilities = capabilities

return M
