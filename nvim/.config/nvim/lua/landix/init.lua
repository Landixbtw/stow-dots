require 'landix.options'
require 'landix.keymaps'
require 'landix.lazy_init'

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup(
		'kickstart-highlight-yank',
		{ clear = true }
	),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('vertical_help', { clear = true }),
	pattern = 'help',
	callback = function()
		vim.bo.bufhidden = 'unload'
		vim.cmd.wincmd 'L'
		vim.cmd.wincmd '='
	end,
})
