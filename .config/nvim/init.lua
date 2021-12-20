local cmd = vim.cmd

cmd 'filetype plugin indent on'

modules = {
  'options',
  'mappings',
  'plugins',
  'lsp',
}

for _, m in ipairs(modules) do require(m) end
