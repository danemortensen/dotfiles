vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Clears the cache and reloads the neovim config.
local function reload_config()
    -- Clear cached modules belonging to the config.
    for name, _ in pairs(package.loaded) do
        if name:match("^user") or name:match("^init") then
            package.loaded[name] = nil
        end
    end

    -- Reload the main init.lua file.
    dofile(vim.env.MYVIMRC)
    vim.notify("Config reloaded!", vim.log.levels.INFO)
end

-- Reload the config with <leader>rs.
vim.keymap.set("n", "<leader>rs", reload_config, { desc = "Reload Neovim config" })

