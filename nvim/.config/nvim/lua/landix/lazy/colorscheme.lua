return {
    {
        -- tsoding emacs theme
        enabled = false,
        'blazkowolf/gruber-darker.nvim',
        config = function()
            vim.cmd.colorscheme 'gruber-darker'
        end,
    },
    {
        -- block cursor is white on white theme
        -- only usable on white terminal background
        enabled = false,
        "LunarVim/templeos.nvim",
        config = function ()
            vim.cmd.colorscheme("templeos")
        end,
    },
    {
        enabled = false,
        "bluz71/vim-moonfly-colors",
        config = function()
            vim.cmd.colorscheme("moonfly")
        end
    },
    {
        enabled = false,
        "phha/zenburn.nvim",
        config = function ()
            vim.cmd.colorscheme("zenburn")
        end
    },
    {
        enabled = false,
        "tjdevries/gruvbuddy.nvim",
        dependencies = {
            "tjdevries/colorbuddy.nvim",
        },
        lazy = false,
        priority = 1000,
        config = function()
            require("custom.gruvbuddy")
            require("colorbuddy").colorscheme("gruvbuddy")
        end,
    },
    {
        enabled = true,
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("tokyonight-moon")
        end
    }
}
