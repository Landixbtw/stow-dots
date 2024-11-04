return {
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
        -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtext_view_general_viewer = "zathura"


            vim.keymap.set("n", "<leader>vv", ":keepjumps VimtexCompile<Return>VimtexView<Return>", { noremap = true, silent = true, desc = "Compile and View PDF"})
        end,
        ft = "tex",
    }
}
