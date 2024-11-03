return {
	{ -- Autoformat
		enabled = false,
		'stevearc/conform.nvim',
		opts = {
			notify_on_error = true,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { 'stylua' },
				python = { 'isort', 'black' },
				go = { 'goimports', 'gofmt' },
				-- c = { 'clang' },
				['_'] = { 'trim_whitespace ' },
			},
		},
	},
}
