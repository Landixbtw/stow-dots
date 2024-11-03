return {
  -- nvim v0.8.0
  {
    'kdheepak/lazygit.nvim',
    lazy = false,
    cmd = {
      'LazyGit',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      -- Lazygit Keymap
      vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { silent = true, desc = 'Open LazyGit' })
    end,
  },
}
