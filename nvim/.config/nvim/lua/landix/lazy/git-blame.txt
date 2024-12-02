return {
  {
    'f-person/git-blame.nvim',
    event = 'VeryLazy',
  },
  vim.keymap.set('n', '<leader>gbo', ':GitBlameOpenCommitURL<CR>', { desc = 'Open the git commit in chrome' }),
  -- Opens commit in chrome
}
