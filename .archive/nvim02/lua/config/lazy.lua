local lazy = {}

-- Bootstrap lazy.nvim.
function lazy.bootstrap()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end
  vim.opt.rtp:prepend(lazypath)
end

-- Set up lazy. Make sure to set up `mapleader` and `maplocalleader` before
-- calling this function.
function lazy.setup()
  require("lazy").setup({
    -- Fetch plugin specs from the `lua/plugins/` directory.
    spec = { { import = "plugins" } },
    install = { colorscheme = { "habamax" } },
    -- Automatically check for plugin updates.
    checker = { enabled = true },
  })
end

return lazy
