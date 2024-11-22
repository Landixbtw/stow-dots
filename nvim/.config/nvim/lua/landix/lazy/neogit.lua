return {
    {
        "NeogitOrg/neogit",
        dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "sindrets/diffview.nvim",        -- optional - Diff integration

        -- Only one of these is needed.
        "nvim-telescope/telescope.nvim", -- optional
        },
        config = true,

-- https://github.com/NeogitOrg/neogit
        -- neogit Keymap
        vim.keymap.set('n', '<leader>gg', ':Neogit cwd=%:p:h <CR>', { silent = true, desc = 'Open Neogit in current repo' }),

        vim.keymap.set('n', '<leader>gc', ':Neogit commit <CR>', { silent = true, desc = 'Open commit popup' }),

        vim.keymap.set('n', '<leader>gp', ':Neogit push<CR>', { silent = true, desc = 'push current commit' }),
    }
}
