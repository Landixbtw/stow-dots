-- vim settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.shiftwidth = 4

vim.opt.breakindent = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.signcolumn = 'yes'

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'

vim.opt.swapfile = false
vim.opt.winborder = "rounded"

-- Gives the orientation line at X characters
vim.opt.colorcolumn = '80'

-- keymaps
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- New tab
keymap.set('n', 'te', ':tabedit<Return>')
keymap.set('n', 'tc', ':tabclose<Return>', opts)
keymap.set('n', '<tab>', ':tabnext<Return>', opts)
keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)

-- open netrw
keymap.set("n", "<leader>nr", vim.cmd.Ex)

keymap.set('n', '<leader>yf', 'ggyG`.', { desc = 'Yank the entire file' })

-- import all the packages
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.icons" }, -- dep for oil

	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	-- { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/nickkadutskyi/jb.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/numToStr/Comment.nvim" },

    { src = "https://github.com/saghen/blink.cmp",
        -- NOTE: Cannot get the rust version right now, not sure why, 
        -- might be an issue with nightly, if more stable and vim.pack.add supports build 
        -- use 
        -- build = "cargo build --release" -- or 
        -- build = "..."
    },
    -- dependencie for blink.cmp
    { src = "https://github.com/rafamadriz/friendly-snippets" },

    { src = "https://github.com/gbprod/cutlass.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },

    -- plenary is a dep for todo-comments and neogit
    { src = "https://github.com/nvim-lua/plenary.nvim" },

    { src = "https://github.com/folke/todo-comments.nvim",
    },
    { src = "https://github.com/folke/which-key.nvim" },
    
    { src = "https://github.com/mbbill/undotree"},

    { src = "https://github.com/NeogitOrg/neogit", 
      dependencies = { 
        "https://github.com/sindrets/diffview.nvim", -- optional for diffview
        "https://github.com/folke/snacks.nvim", -- this is optional
        }
    },

    { src = "https://github.com/nvim-telescope/telescope.nvim", 
        dependencies = { 
            "https://github.com/nvim-lua/plenary.nvim",  -- Required dependency
            "https://github.com/sharkdp/fd",
            "https://github.com/nvim-tree/nvim-web-devicons",
            "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
            "https://github.com/nvim-telescope/telescope-ui-select.nvim",
        }
    },

    { src = "https://github.com/code-biscuits/nvim-biscuits", 
        dependencies = {
            "https:://github.com/nvim-treesitter/nvim-treesitter",
        }
    },


    -- colorschemes
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/xeind/nightingale.nvim" },
    { src = "https://github.com/ramojus/mellifluous.nvim" },
    { src="https://github.com/Kaikacy/Lemons.nvim" }, 

})


    vim.diagnostic.config({
        virtual_text = {
            enabled = true,
            source = "if_many",  -- Show source if multiple sources
            spacing = 4,         -- Space between text and virtual text
            prefix = "●",        -- Prefix character
            format = nil,        -- Custom formatting function
        },
        signs = true,            -- Show signs in sign column
        underline = true,        -- Underline problematic text
        update_in_insert = false, -- Don't update diagnostics in insert mode
        severity_sort = true,    -- Sort by severity
    })

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
            local client = vim.lsp.get_client_by_id(ev.data.client_id)
            
            -- Enable completion
            if client:supports_method('textDocument/completion') then
                vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
            end
            
            -- Enable inlay hints
            if client:supports_method('textDocument/inlayHint') then
                vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
            end
        end,
    })

vim.cmd("set completeopt+=noselect")

-- setup all the packages,

require('blink.cmp').setup({
  keymap = {
    preset = 'default',  -- Use default keybindings (like Ctrl+y to accept)
  },

  -- Fuzzy finder configuration
  fuzzy = {
    -- Choose implementation: 'lua' or 'prefer_rust' or 'prefer_rust_with_warning'
    implementation = 'prefer_rust_with_warning',  -- Uses the fast Rust-based fuzzy matcher
    
    -- Sorting configuration
    sorts = { 'score', 'sort_text', 'label' },
  },

  -- Completion sources
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  -- Appearance
  appearance = {
    nerd_font_variant = 'normal',  -- mono or 'normal' if you don't use nerd fonts
  },

  -- Completion behavior
  completion = {
    -- Auto-bracket support
    auto_brackets = {
      enabled = true,
    },
    
    -- Documentation
    documentation = {
      auto_show = true,  -- Set to false if you don't want auto documentation
    },
  },
})


require "oil".setup({
    default_file_explorer = true, -- set to false, for ie netrw
    columns = { 
        "icon",
        "permissions",
    },

    win_options = { 
        wrap = false,
        signcolumn = "yes",
        foldcolumn = "0",
        -- spell = false, -- ???
        list = false,
        conceallevel = 3, -- ? ?
        concealcursor = "nvic", -- ??
    },

    -- dont perm delete files, send them to :help oil-trash first
    delete_to_trash = false,
     -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
    skip_confirm_for_simple_edits = false,
    -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
    -- (:help prompt_save_on_select_new_entry)
    prompt_save_on_select_new_entry = true,

    lsp_file_methods = {
        -- Enable or disable LSP file operations
        enabled = true,
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 1000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = false,
    },

    -- Constrain the cursor to the editable parts of the oil buffer
    -- Set to `false` to disable, or "name" to keep it on the file names
    constrain_cursor = "editable",
    -- Set to true to watch the filesystem for changes and reload oil
    watch_for_changes = true,

    view_options = {
        show_hidden = false,

        is_hidden_file = function(name, bufnr)
            local m = name:match("^%.")
            return m ~= nil
        end, 

        -- sort files with numbers
        natural_order = "true", -- set to fast, to disable for large dir
        case_insensitive = false,

        -- set sort order
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { "type", "asc" },
          { "name", "asc" },
        },
    },
})
keymap.set("n", "_", ":Oil<CR>", { desc = "Open parent directory "})

require "nvim-autopairs".setup()

require "mini.pick".setup()
require "nvim-treesitter.configs".setup({
    ensure_installed = {"c", "go", "lua", "rust", "cpp"},
    highlight = { enable = true }
})

require("Comment").setup()
require("cutlass").setup({
    cut_key = "c"
})

require('gitsigns').setup({
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
  word_diff = false,
  watch_gitdir = {
    follow_files = true,
  },
})

require("todo-comments").setup({
    win = {
        border = "single",
        padding = { 2, 2,2,2},
    }
})

require("which-key").setup({
  { "<leader>c", group = "[C]ode" },
  { "<leader>c_", hidden = true },
  { "<leader>d", group = "[D]ocument" },
  { "<leader>d_", hidden = true },
  { "<leader>r", group = "[R]ename" },
  { "<leader>r_", hidden = true },
  { "<leader>s", group = "[S]earch" },
  { "<leader>s_", hidden = true },
  { "<leader>w", group = "[W]orkspace" },
  { "<leader>w_", hidden = true },
  -- Add todo-comments keybinding in new format
  { "<leader>st", ":TodoTelescope<CR>", desc = "Search Todos across project" },
})

-- NOTE: Experimental telescope setup
require('telescope').setup {
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')


local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

-- Advanced keymaps
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    }
end, { desc = '[S]earch [/] in Open Files' })

vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-----------------------------------------------

require("mini.icons").setup()
-- require("neogit").setup()

require("nvim-biscuits").setup(
    {
        cursor_line_only = true
    }
)




-- Keymaps for plugins 
-- undotree does not seem to be a "module", so it does not need to be required, just works like this
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Open Undotree"})

keymap.set('n', '<leader>gg', ':Neogit cwd=%:p:h <CR>', { silent = true, desc = 'Open Neogit in current repo' })
keymap.set('n', '<leader>gc', ':Neogit commit <CR>', { silent = true, desc = 'Open commit popup' })
keymap.set('n', '<leader>gp', ':Neogit push<CR>', { silent = true, desc = 'push current commit' })


vim.lsp.enable({"lua_ls", "clangd", "gopls", "rust_analyzer"})


require "vague".setup({ transparent = true })
require "jb".setup({ transparent = true })
vim.cmd("colorscheme lemons")
vim.cmd(":hi statusline guibg=NONE")
