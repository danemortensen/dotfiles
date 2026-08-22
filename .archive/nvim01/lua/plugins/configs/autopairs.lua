local M = {}

function M.setup()
  require('nvim-autopairs').setup({
    check_ts = true,
    ts_config = {
      lua = { 'string', 'source' },
    },
    disable_filetype = { 'TelescopePrompt' },
  })
end

return M
