return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  enabled = false ,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'antosha417/nvim-lsp-file-operations',
    'echasnovski/mini.base16',
  },

  vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Open File tree ' }),
  vim.keymap.set('n', '<leader>tf', ':NvimTreeFindFile<CR>', { desc = 'Move the cursor for the current buffer' }),
  vim.keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>', { desc = 'Collapse nvim-tree recursevly' }),
  config = function()
    require('nvim-tree').setup {}
  end,
}
