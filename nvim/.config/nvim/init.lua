-- Get the standard Neovim configuration directory path
local config_path = vim.fn.stdpath('config')

-- Define the pattern for Lua modules directly inside the config path
-- '?.lua' means look for 'modulename.lua'
-- '?/init.lua' means look for 'modulename/init.lua' (add this if you might have modules structured that way)
local custom_lua_pattern = config_path .. '/?.lua;' .. config_path .. '/?/init.lua'

-- Prepend our custom pattern to the existing package.path
-- Prepending gives it priority over standard paths if there are name conflicts,
-- though appending (package.path = package.path .. ';' .. custom_lua_pattern) also works.
package.path = custom_lua_pattern .. ';' .. package.path

require("landix")
require("lsp.setup")

vim.lsp.enable({'clangd', 'luals', 'jdtls'})
