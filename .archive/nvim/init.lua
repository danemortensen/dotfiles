vim.cmd 'filetype plugin indent on'

local modules = {
  'options',
  'mappings',
  'plugins',
  'lsp',
  'completions',
}

for _, m in ipairs(modules) do require(m) end
