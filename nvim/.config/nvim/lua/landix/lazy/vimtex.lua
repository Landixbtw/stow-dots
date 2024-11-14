return {
    {
        "lervag/vimtex",
        lazy = false, -- Don't lazy load VimTeX
        init = function()
            -- Set up Okular as the PDF viewer with VimTeX
            vim.g.vimtex_view_method = "general"
            vim.g.vimtex_view_general_viewer = "okular"
            vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'

            -- Keybinding to compile and open the PDF viewer
            -- vim.keymap.set("n", "<leader>lx", ":keepjumps VimtexCompile<CR>:VimtexView<CR>", { noremap = true, silent = true, desc = "Compile and View PDF" })
        end,
        ft = "tex",
    }
}

