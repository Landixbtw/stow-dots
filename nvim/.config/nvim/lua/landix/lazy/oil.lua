return {
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require("oil").setup {
                colums = { "icon" },
                keymaps = {
                    ["<C-h>"] = false,
                    ["<M-h>"] = "action.select_split",
                },
                view_options = {
                    show_hidden = true,
                },
            }
            vim.keymap.set("n", "_", ":Oil<CR>", { desc = "Open parent directory "})
            vim.keymap.set("n", "<space>-", require("oil").toggle_float)
        end,
    },
}
