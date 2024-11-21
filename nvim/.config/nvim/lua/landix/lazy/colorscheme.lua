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
        -- vcsode but better
		enabled = false,
		'rockyzhang24/arctic.nvim',
		branch = 'v2',
		dependencies = { 'rktjmp/lush.nvim' },
		config = function()
			vim.cmd.colorscheme 'arctic'
		end,
	},
    {
        -- block cursor is white on white theme
        enabled = false,
        "LunarVim/templeos.nvim",
        config = function ()
            vim.cmd.colorscheme("templeos")
        end,
    },
    {
        enabled = false,
        "vague2k/vague.nvim",
        config = function ()
            vim.cmd.colorscheme("vague")
        end
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
        enabled = true,
        "cpwrs/americano.nvim",
        config = function()
            vim.cmd.colorscheme("americano")
        end
    },
    {
        enabled = false,
        "nuvic/flexoki-nvim",
        config = function ()
            vim.cmd.colorscheme("flexoki")
        end
    }
}

