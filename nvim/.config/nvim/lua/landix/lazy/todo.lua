return {
    {
        'folke/todo-comments.nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = true }
    },
    {         'folke/which-key.nvim',
        event = 'VimEnter',
        config = function()
            local wk = require('which-key')

            wk.setup({
                win = {
                    border = "single",
                    padding = { 2, 2, 2, 2 },
                },
            })

            wk.add({
                { "<leader>c", group = "[C]ode" },
                { "<leader>c_", hidden = true },
                { "<leader>d", group = "[D]ocument" },
                { "<leader>d_", hidden = true },
                { "<leader>r", group = "[R]ename" },
                { "<leader>r_", hidden = true },
                { "<leader>s", group = "[S]earch" },
                { "<leader>s_", hidden = true },
                { "<leader>w", group = "[W]orkspace" },
                { "<leader>w_", hidden = true },
                -- Add todo-comments keybinding in new format
                { "<leader>st", ":TodoTelescope<CR>", desc = "Search Todos across project" },
            })
        end,
    },
}
