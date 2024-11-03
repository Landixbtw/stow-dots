return {
  -- Lua
  {
    'folke/zen-mode.nvim',
    lazy = false,
    opts = {
      plugins = {
        twilight = false,
        gitsigns = true,
        tmux = true,
        kitty = { enabled = true, font = '+2' },
        alacritty = { enabled = true, font = '15' },
      },
    },
    config = function()
      -- ZenMode Keymap
      vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', { silent = true, desc = 'Toggle ZenMode' })
    end,
  },
}
