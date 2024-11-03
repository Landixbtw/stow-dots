return {
	{
		enabled = true,
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			-- Define the colors for the indentation guides
			-- local highlight = {
			-- 	'RainbowRed',
			-- 	'RainbowYellow',
			-- 	'RainbowBlue',
			-- 	'RainbowOrange',
			-- 	'RainbowGreen',
			-- 	'RainbowViolet',
			-- 	'RainbowCyan',
			-- }
			--
			-- Register a hook to create highlight groups, ensuring they are reset with every colorscheme change
			-- local hooks = require 'ibl.hooks'
			-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- 	vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
			-- 	vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
			-- 	vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
			-- 	vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
			-- 	vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
			-- 	vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
			-- 	vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
			-- end)
			-- --
			-- Setup the indent-blankline plugin with the defined colors
			require('ibl').setup {
				indent = { highlight = highlight },
			}
		end,
	},
}
