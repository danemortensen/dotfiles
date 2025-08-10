local lazy = require("config.lazy")
lazy.bootstrap()

vim.keymap.set("i", "jj", "<Esc>", {})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local indent = 2

local opt = {
  syntax = "enable",
  clipboard = "unnamedplus",
  wrap = false,

  -- line numbers
  number = true,
  relativenumber = true,

  -- indentation
  autoindent = true,
  expandtab = true,
  shiftwidth = indent,
  smartindent = true,
  softtabstop = indent,
  tabstop = indent,
  shiftround = true,

  -- search
  hlsearch = true,
  ignorecase = true,

  -- backups
  backup = false,
  swapfile = false,
  writebackup = false,
}
for k, v in pairs(opt) do
  vim.opt[k] = v
end

lazy.setup() -- Set `mapleader` and `maplocalleader` before this point.
