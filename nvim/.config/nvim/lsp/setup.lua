-- LSP Setup with enhanced hover and documentation

-- Auto completion
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
    end
    
    -- Buffer local mappings for better K navigation
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    
    -- Enhanced K mapping - press once for hover
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    
    -- Press K twice to jump into the hover window
    vim.keymap.set('n', 'KK', function()
      vim.lsp.buf.hover()
      vim.lsp.buf.hover()
    end, opts)
    
    -- Additional mappings for documentation/navigation
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts) -- Alternative hover mapping
  end,
})

-- Diagnostic configuration
vim.diagnostic.config({ 
    virtual_text = { 
        current_line = true,
    },
    
    virtual_lines = {
        current_line = true
    },
})

-- Enhanced hover window with better documentation display
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "rounded",
        max_width = 80,
        max_height = 30,
        focusable = true,  -- Allows scrolling through long documentation
        -- Optional: You can also add these for more control
        -- wrap = true,     -- Wrap long lines
        -- close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    }
)

-- Enhanced signature help
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = "rounded",
        focusable = false,
        max_width = 80,
    }
)

-- Optional: Better diagnostic float windows
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Enable virtual text for current line only
        virtual_text = {
            spacing = 4,
            prefix = '●',
            -- Show source of diagnostic (e.g., 'gopls', 'clangd')
            source = "if_many",
        },
        -- Show diagnostics in a floating window
        float = {
            source = "always",
            border = "rounded",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
    }
)

-- Optional: Automatically show hover documentation after a delay
-- Uncomment if you want automatic documentation on cursor hold
--[[ 
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})
--]]

-- Optional: Set updatetime for CursorHold event (default is 4000ms)
vim.o.updatetime = 1000

-- Optional: Better completion menu appearance
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'preview' }

-- Optional: Show documentation in preview window during completion
vim.opt.completeopt:append('preview')
