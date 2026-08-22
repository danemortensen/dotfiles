local options = {
  clipboard = 'unnamedplus',  -- Always use the system clipboard
  expandtab = true,           -- Convert tabs to spaces
  hlsearch = true,            -- Highlight all matches of search pattern
  ignorecase = true,          -- Ignore case in searches
  number = true,              -- Display line numbers
  relativenumber = true,      -- Use relative line numbers
  shiftwidth = 4,             -- Use four spaces per (auto)indent
  tabstop = 4,                -- Display each <Tab> as four spaces
  wrap = false,               -- Display long lines as single lines
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
