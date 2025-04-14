vim.lsp.config['luals'] = {
    -- Command and arguments to start the server.
    cmd = { 'lua-language-server' },
    -- Filetypes to automatically attach to.
    filetypes = { 'luals'},
    -- some commets maybe neovim.io/doc/user/lsp.html#_quickstart
    root_markers = { '.luarc.json', '.luarc.jsonc' },
    -- more comments
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            }
        }
    }
}
